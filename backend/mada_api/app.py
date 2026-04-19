from __future__ import annotations

import asyncio
import sys

# Ensure Windows subprocess support for Playwright
if sys.platform == "win32":
    if not isinstance(asyncio.get_event_loop_policy(), asyncio.WindowsProactorEventLoopPolicy):
        asyncio.set_event_loop_policy(asyncio.WindowsProactorEventLoopPolicy())

from contextlib import asynccontextmanager

from fastapi import Depends, FastAPI, Form, HTTPException
from fastapi.middleware.cors import CORSMiddleware

from .config import settings
from .models import AuthResponse, DataResponse, ErrorResponse, PostbackRequest, SessionInfo
from .service import MadaAutomationService


service = MadaAutomationService(settings)


@asynccontextmanager
async def lifespan(_: FastAPI):
    await service.start()
    try:
        yield
    finally:
        await service.stop()


def get_service() -> MadaAutomationService:
    return service


def create_app() -> FastAPI:
    app = FastAPI(
        title="MADA Modern Client API",
        version="0.1.0",
        lifespan=lifespan,
        responses={
            401: {"model": ErrorResponse},
            502: {"model": ErrorResponse},
        },
    )

    app.add_middleware(
        CORSMiddleware,
        allow_origins=settings.frontend_origins,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    @app.get("/api/health")
    async def healthcheck() -> dict[str, str]:
        return {"status": "ok"}

    @app.post("/api/auth/login", response_model=AuthResponse)
    async def login(
        username: str = Form(...),
        password: str = Form(...),
        captcha: str | None = Form(None),
        session_id: str | None = Form(None),
        otp_code: str | None = Form(None),
        request_sms: bool = Form(False),
        mada_service: MadaAutomationService = Depends(get_service),
    ) -> AuthResponse:
        session_id = await mada_service.login(
            username=username, 
            password=password, 
            session_id=session_id, 
            captcha=captcha,
            otp_code=otp_code,
            request_sms=request_sms
        )
        return AuthResponse(session_id=session_id)

    @app.get("/api/auth/session", response_model=SessionInfo)
    async def auth_session(
        session_id: str,
        mada_service: MadaAutomationService = Depends(get_service),
    ) -> SessionInfo:
        session = await mada_service.session_info(session_id)
        return SessionInfo(session_id=session["session_id"], current_url=session["current_url"])

    @app.delete("/api/auth/session/{session_id}")
    async def logout(session_id: str, mada_service: MadaAutomationService = Depends(get_service)) -> dict[str, bool]:
        await mada_service.logout(session_id)
        return {"success": True}

    @app.get("/api/shifts", response_model=DataResponse)
    async def shifts(
        session_id: str,
        mada_service: MadaAutomationService = Depends(get_service),
    ) -> DataResponse:
        data = await mada_service.get_shift_data(session_id=session_id)
        return DataResponse(data=data)

    @app.post("/api/shifts/postback", response_model=DataResponse)
    async def postback(
        request: PostbackRequest,
        mada_service: MadaAutomationService = Depends(get_service),
    ) -> DataResponse:
        argument = request.argument
        if request.action_type == "cancel":
            if not request.reason or not request.reason.strip():
                raise HTTPException(status_code=422, detail="A cancellation reason is required for this action.")
            argument = f"{request.argument}_{request.reason.strip()}"

        data = await mada_service.postback(
            session_id=request.session_id,
            target=request.target,
            argument=argument,
        )
        return DataResponse(data=data)

    return app
