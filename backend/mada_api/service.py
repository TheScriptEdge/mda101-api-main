from __future__ import annotations

import asyncio
import logging
import random
import math
from dataclasses import dataclass, field
from time import time
from urllib.parse import urljoin, urlparse
from uuid import uuid4

from fastapi import HTTPException, status
from playwright.async_api import Browser, BrowserContext, Error, Page, Playwright, TimeoutError, async_playwright

from .config import Settings
from .models import ShiftData
from .parser import parse_shift_page

logger = logging.getLogger(__name__)


LOGIN_PATH = "/Default.aspx"
SHIFTS_PATH = "/Shibutz.aspx"


@dataclass(slots=True)
class SessionState:
    session_id: str
    context: BrowserContext
    page: Page
    created_at: float = field(default_factory=time)
    last_used_at: float = field(default_factory=time)

    def touch(self) -> None:
        self.last_used_at = time()


class MadaAutomationService:
    def __init__(self, settings: Settings):
        self.settings = settings
        self._playwright: Playwright | None = None
        self._browser: Browser | None = None
        self._sessions: dict[str, SessionState] = {}
        self._lock: asyncio.Lock | None = None

    @property
    def lock(self) -> asyncio.Lock:
        if self._lock is None:
            self._lock = asyncio.Lock()
        return self._lock

    async def start(self) -> None:
        self._playwright = await async_playwright().start()
        self._browser = await self._playwright.chromium.launch(
            headless=self.settings.browser_headless,
            args=[
                "--disable-blink-features=AutomationControlled",
                "--disable-dev-shm-usage",
                "--no-sandbox",
                "--disable-setuid-sandbox",
                "--disable-web-security",
                "--disable-features=IsolateOrigins,site-per-process"
            ]
        )

    async def stop(self) -> None:
        for session in list(self._sessions.values()):
            await session.context.close()
        self._sessions.clear()

        if self._browser is not None:
            await self._browser.close()
            self._browser = None

        if self._playwright is not None:
            await self._playwright.stop()
            self._playwright = None

    async def login(
        self, username: str, password: str, session_id: str | None = None, captcha: str | None = None,
        otp_code: str | None = None, request_sms: bool = False
    ) -> str:
        if self._browser is None:
            raise RuntimeError("Browser is not ready")

        if session_id:
            async with self.lock:
                session = self._sessions.get(session_id)
            if not session or session.page.is_closed():
                raise HTTPException(status_code=401, detail="Session expired, please refresh.")
            context = session.context
            page = session.page
            session.touch()
        else:
            context = await self._browser.new_context(locale="he-IL", timezone_id="Asia/Jerusalem")
            page = await context.new_page()
            
            from playwright_stealth import Stealth
            await Stealth().apply_stealth_async(page)

            # --- Anti-Bot Fingerprint Spoofing ---
            await page.add_init_script("""() => {
                // 1. Spoof navigator.webdriver
                Object.defineProperty(navigator, 'webdriver', { get: () => undefined });
                
                // 2. Fix window.chrome
                window.chrome = { runtime: {} };

                // 3. Canvas Fingerprinting Protection
                const originalToDataURL = HTMLCanvasElement.prototype.toDataURL;
                HTMLCanvasElement.prototype.toDataURL = function(type) {
                    if (type === 'image/png' && this.width > 0 && this.height > 0) {
                        const ctx = this.getContext('2d');
                        if (ctx) {
                            const imageData = ctx.getImageData(0, 0, this.width, this.height);
                            // Add minimal noise
                            for (let i = 0; i < imageData.data.length; i += 4) {
                                imageData.data[i] += Math.floor(Math.random() * 3) - 1;
                            }
                            ctx.putImageData(imageData, 0, 0);
                        }
                    }
                    return originalToDataURL.apply(this, arguments);
                };

                // 4. WebGL Fingerprinting Protection
                const getParameter = WebGLRenderingContext.prototype.getParameter;
                WebGLRenderingContext.prototype.getParameter = function(parameter) {
                    // UNMASKED_VENDOR_WEBGL
                    if (parameter === 37445) return 'Intel Inc.';
                    // UNMASKED_RENDERER_WEBGL
                    if (parameter === 37446) return 'Intel Iris OpenGL Engine';
                    return getParameter.apply(this, arguments);
                };

                // 5. Spoof Plugins
                Object.defineProperty(navigator, 'plugins', {
                    get: () => [
                        { name: 'Chrome PDF Plugin', filename: 'internal-pdf-viewer', description: 'Portable Document Format' },
                        { name: 'Chrome PDF Viewer', filename: 'mhjfbmdgcfjbbpaeojofohoefgiehjai', description: '' }
                    ]
                });
            }""")
            
            page.set_default_timeout(self.settings.browser_timeout_ms)

            session_id = uuid4().hex
            async with self.lock:
                self._sessions[session_id] = SessionState(session_id=session_id, context=context, page=page)

        try:
            current_path_login = urlparse(page.url).path.lower()
            if page.url == "about:blank" or not current_path_login.endswith(LOGIN_PATH.lower()):
                login_url = urljoin(self.settings.base_url, LOGIN_PATH)
                logger.info("Navigating to login page: %s", login_url)
                await page.goto(login_url, wait_until="domcontentloaded")

                # Handle potential Cloudflare challenges immediately after navigation
                await self._handle_cloudflare(page)

                current_url = page.url
                title = await page.title()
                logger.info("After initial load — URL: %s | Title: %s", current_url, title)

                await self._handle_cloudflare(page)

            # Check if we're on the 2FA screen
            if await page.locator("#tb2FACode").is_visible():
                if request_sms:
                    logger.info("Requesting 2FA via SMS")
                    sms_btn = page.locator("#btn2FASendSMS")
                    if await sms_btn.count() > 0:
                        is_disabled = await sms_btn.is_disabled()
                        if not is_disabled:
                            async with page.expect_navigation(wait_until="networkidle"):
                                await sms_btn.click()
                        else:
                            logger.info("SMS button is disabled, maybe SMS was already sent.")
                    else:
                        raise HTTPException(status_code=400, detail="SMS option not found on page.")
                    
                    header_text = await page.locator("#lbl2FAHeader").inner_text() if await page.locator("#lbl2FAHeader").count() > 0 else ""
                    import re
                    email_match = re.search(r'([\w.*-]+@[\w.-]+)', header_text)
                    masked_email = email_match.group(1) if email_match else header_text.replace('קוד אימות נשלח לאימייל', '').strip()

                    msg = "SMS code requested."
                    if await page.locator("#lbl2FAError").count() > 0:
                        error_text = await page.locator("#lbl2FAError").inner_text()
                        if error_text.strip():
                            msg = error_text.strip()
                            
                    raise HTTPException(
                        status_code=403,
                        detail={
                            "error": "2fa_required",
                            "message": msg,
                            "masked_email": masked_email,
                            "session_id": session_id
                        }
                    )
                elif otp_code:
                    logger.info("Submitting OTP code")
                    await page.locator("#tb2FACode").fill(otp_code)
                    async with page.expect_navigation(wait_until="networkidle"):
                        await page.locator("#btn2FAVerify").click()
                else:
                    header_text = await page.locator("#lbl2FAHeader").inner_text() if await page.locator("#lbl2FAHeader").count() > 0 else ""
                    import re
                    email_match = re.search(r'([\w.*-]+@[\w.-]+)', header_text)
                    masked_email = email_match.group(1) if email_match else header_text.replace('קוד אימות נשלח לאימייל', '').strip()
                    
                    msg = "A 2FA code is required."
                    if await page.locator("#lbl2FAError").count() > 0:
                        error_text = await page.locator("#lbl2FAError").inner_text()
                        if error_text.strip():
                            msg = error_text.strip()

                    raise HTTPException(
                        status_code=403,
                        detail={
                            "error": "2fa_required",
                            "message": msg,
                            "masked_email": masked_email,
                            "session_id": session_id
                        }
                    )
            else:
                # Check if the login form exists
                tb_user_count = await page.locator("#tbUser").count()
                if tb_user_count == 0:
                    logger.error("Login form not found! Page may be blocked by Cloudflare. URL: %s", page.url)
                    body_text = await page.locator("body").inner_text()
                    logger.error("Page body text (first 500 chars): %s", body_text[:500])
                    await self.logout(session_id)
                    raise HTTPException(
                        status_code=status.HTTP_502_BAD_GATEWAY,
                        detail="Could not reach the login page — the site may be blocking automated access.",
                    )

                await self._human_type(page, "#tbUser", username)
                await self._human_type(page, "#tbPass", password)

                # Check if captcha is visible and needed
                needs_captcha = False
                captcha_image_base64 = None
                
                if await page.locator("#trCaptcha").is_visible():
                    needs_captcha = True
                    
                    # Fetch captcha image as base64
                    try:
                        img_locator = page.locator("#trCaptcha img")
                        if await img_locator.count() > 0:
                            import base64
                            image_buffer = await img_locator.screenshot()
                            captcha_image_base64 = base64.b64encode(image_buffer).decode("utf-8")
                    except Exception as e:
                        logger.warning("Failed to screenshot captcha: %s", e)
                
                if needs_captcha:
                    if not captcha:
                        logger.info("Captcha required but not provided. Requesting captcha from client.")
                        raise HTTPException(
                            status_code=403,
                            detail={
                                "error": "captcha_required", 
                                "message": "A CAPTCHA must be solved to login.",
                                "captcha_image": captcha_image_base64,
                                "session_id": session_id
                            }
                        )
                    else:
                        logger.info("Filling provided captcha")
                        await self._human_type(page, "#tbCaptcha", captcha)

                async with page.expect_navigation(wait_until="networkidle"):
                    await self._human_click(page, "#btnLogin")
        except TimeoutError:
            logger.warning("Navigation timeout after click, waiting for domcontentloaded...")
            await page.wait_for_load_state("domcontentloaded")
        except HTTPException:
            raise
        except Error as exc:
            logger.error("Playwright error during login: %s", exc)
            await self.logout(session_id)
            raise HTTPException(status_code=status.HTTP_502_BAD_GATEWAY, detail=f"Login automation failed: {exc}") from exc

        # Debug: log what we see after the login attempt
        post_login_url = page.url
        post_login_title = await page.title()
        logger.info("After login attempt — URL: %s | Title: %s", post_login_url, post_login_title)

        # First check if 2FA is needed AFTER the initial login submission
        if not await self._is_authenticated(page):
            if await page.locator("#tb2FACode").is_visible():
                logger.info("2FA is required!")
                header_text = await page.locator("#lbl2FAHeader").inner_text() if await page.locator("#lbl2FAHeader").count() > 0 else ""
                import re
                email_match = re.search(r'([\w.*-]+@[\w.-]+)', header_text)
                masked_email = email_match.group(1) if email_match else header_text.replace('קוד אימות נשלח לאימייל', '').strip()
                
                # Check if there is an error message (like 'Invalid code')
                msg = "A 2FA code is required."
                try:
                    if await page.locator("#lbl2FAError").count() > 0:
                        lbl_error = await page.locator("#lbl2FAError").inner_text()
                        if lbl_error.strip():
                            msg = f"{lbl_error.strip()}"
                except Exception:
                    pass

                raise HTTPException(
                    status_code=403,
                    detail={
                        "error": "2fa_required",
                        "message": msg,
                        "masked_email": masked_email,
                        "session_id": session_id
                    }
                )

            # Save a debug screenshot
            try:
                await page.screenshot(path="debug_login_failure.png", full_page=True)
                logger.info("Debug screenshot saved to debug_login_failure.png")
            except Exception as e:
                logger.warning("Could not save debug screenshot: %s", e)

            # Try to grab the exact error from the upstream site
            error_detail = "Login failed. Check the username and password and try again."
            needs_new_captcha = False
            captcha_image_base64 = None
            
            try:
                if await page.locator("#lblError").count() > 0:
                    lbl_error = await page.locator("#lblError").inner_text()
                    if lbl_error.strip():
                        error_detail = f"Login failed (upstream): {lbl_error.strip()}"
                
                if await page.locator("#trCaptcha").is_visible():
                    needs_new_captcha = True
                    error_detail += " (Invalid credentials or CAPTCHA)"
                    try:
                        img_locator = page.locator("#trCaptcha img")
                        if await img_locator.count() > 0:
                            import base64
                            image_buffer = await img_locator.screenshot()
                            captcha_image_base64 = base64.b64encode(image_buffer).decode("utf-8")
                    except Exception as e:
                        logger.warning("Failed to screenshot new captcha: %s", e)
            except Exception:
                pass # Fallback to default error
            
            if needs_new_captcha:
                raise HTTPException(
                    status_code=403,
                    detail={
                        "error": "captcha_required", 
                        "message": error_detail,
                        "captcha_image": captcha_image_base64,
                        "session_id": session_id
                    }
                )
                
            await self.logout(session_id)
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail=error_detail,
            )

        return session_id

    async def get_shift_data(self, session_id: str) -> ShiftData:
        session = await self._get_session(session_id)
        await self._ensure_shift_page(session)
        html = await session.page.content()
        return parse_shift_page(html, self.settings.base_url)

    async def postback(
        self,
        session_id: str,
        *,
        target: str,
        argument: str,
    ) -> ShiftData:
        session = await self._get_session(session_id)
        await self._ensure_shift_page(session)

        await self._run_postback(session.page, target=target, argument=argument)
        html = await session.page.content()
        return parse_shift_page(html, self.settings.base_url)

    async def session_info(self, session_id: str) -> dict[str, str]:
        session = await self._get_session(session_id)
        return {
            "session_id": session.session_id,
            "current_url": session.page.url,
        }

    # --- Anti-Bot Helper Methods ---

    async def _handle_cloudflare(self, page: Page, timeout_ms: int = 30000) -> None:
        """Detect and wait for Cloudflare challenges to resolve."""
        try:
            # Detect by title or common strings
            title = await page.title()
            content = await page.content()
            
            is_challenge = (
                "Just a moment" in title or 
                "Checking your browser" in content or 
                "cloudflare" in content or
                await page.locator("#challenge-form").is_visible()
            )

            if is_challenge:
                logger.warning("Cloudflare challenge detected, waiting for resolution...")
                # Wait until title changes from "Just a moment"
                start_time = time()
                while time() - start_time < (timeout_ms / 1000):
                    title = await page.title()
                    if "Just a moment" not in title:
                        break
                    await page.wait_for_timeout(1000)
                
                # Check for Turnstile iframe and wait if hidden
                turnstile = page.frame_locator('iframe[src*="challenges.cloudflare.com"]')
                if await turnstile.locator("#challenge-stage").count() > 0:
                    try:
                        await turnstile.locator("#challenge-stage").wait_for(state="hidden", timeout=15000)
                        logger.info("Turnstile challenge passed")
                    except Exception:
                        logger.warning("Turnstile challenge still present, might need manual action")
                
                await page.wait_for_timeout(self._random_delay(1500, 3000))
                logger.info("Proceeding after Cloudflare check")

        except Exception as e:
            logger.debug("Error during Cloudflare detection: %s", e)

    async def _human_click(self, page: Page, selector: str) -> None:
        """Move mouse realistically to an element and click."""
        locator = page.locator(selector)
        box = await locator.bounding_box()
        if box:
            # Move to a random point within the element
            target_x = box["x"] + box["width"] * random.random()
            target_y = box["y"] + box["height"] * random.random()
            
            # Simulate a few steps of movement
            await page.mouse.move(target_x, target_y, steps=random.randint(5, 10))
            await page.wait_for_timeout(self._random_delay(100, 300))
            await page.mouse.click(target_x, target_y)
        else:
            await locator.click()

    async def _human_type(self, page: Page, selector: str, text: str) -> None:
        """Type text character by character with random delays and occasional typos."""
        locator = page.locator(selector)
        await locator.click()
        await locator.fill("")
        await page.wait_for_timeout(self._random_delay(200, 500))
        
        for char in text:
            # 2% chance of a typo
            if random.random() < 0.02:
                typo_char = random.choice("abcdefghijklmnopqrstuvwxyz")
                await page.keyboard.type(typo_char)
                await page.wait_for_timeout(self._random_delay(100, 300))
                await page.keyboard.press("Backspace")
                await page.wait_for_timeout(self._random_delay(100, 200))
                
            await page.keyboard.type(char)
            await page.wait_for_timeout(self._random_delay(50, 200))

    async def _human_scroll(self, page: Page) -> None:
        """Randomly scroll the page to simulate reading."""
        scroll_height = await page.evaluate("document.body.scrollHeight")
        viewport_height = await page.evaluate("window.innerHeight")
        
        current_y = 0
        while current_y < scroll_height:
            step = random.randint(200, 500)
            current_y += step
            await page.evaluate(f"window.scrollTo(0, {current_y})")
            await page.wait_for_timeout(self._random_delay(500, 1500))
            if current_y > scroll_height: break

    def _random_delay(self, min_ms: int, max_ms: int) -> int:
        """Return a random delay between min and max."""
        return random.randint(min_ms, max_ms)

    async def logout(self, session_id: str) -> None:
        async with self.lock:
            session = self._sessions.pop(session_id, None)

        if session is None:
            return

        await session.context.close()

    async def _run_postback(self, page: Page, *, target: str, argument: str) -> None:
        try:
            async with page.expect_navigation(wait_until="networkidle"):
                await page.evaluate(
                    """([eventTarget, eventArgument]) => {
                        window.__doPostBack(eventTarget, eventArgument);
                    }""",
                    [target, argument],
                )
        except TimeoutError:
            await page.wait_for_load_state("networkidle")

    async def _ensure_shift_page(self, session: SessionState) -> None:
        session.touch()
        current_path = urlparse(session.page.url).path.lower()
        if not current_path.endswith(SHIFTS_PATH.lower()):
            await session.page.goto(urljoin(self.settings.base_url, SHIFTS_PATH), wait_until="networkidle")

        if not await self._is_authenticated(session.page):
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Session expired. Please log in again.")

        if await session.page.locator("#ctl00_ContentPlaceHolder1_tblShibutz").count() == 0:
            raise HTTPException(
                status_code=status.HTTP_502_BAD_GATEWAY,
                detail="Authenticated, but the shifts page did not render as expected.",
            )

    async def _get_session(self, session_id: str) -> SessionState:
        async with self.lock:
            session = self._sessions.get(session_id)

        if session is None:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Unknown or expired session.")

        if session.page.is_closed():
            await self.logout(session_id)
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Session is no longer available.")

        session.touch()
        return session

    async def _is_authenticated(self, page: Page) -> bool:
        if await page.locator("#ctl00_btnDisconnect").count() > 0:
            return True
        if await page.locator("#ctl00_ContentPlaceHolder1_tblShibutz").count() > 0:
            return True

        current_path = urlparse(page.url).path.lower()
        if current_path.endswith(LOGIN_PATH.lower()) and await page.locator("#pnlLogin").count() > 0:
            return False

        return await page.locator("form#aspnetForm").count() > 0 and LOGIN_PATH.lower() not in current_path
