from __future__ import annotations

from dataclasses import dataclass
import os


def _split_csv(value: str) -> list[str]:
    return [item.strip() for item in value.split(",") if item.strip()]


@dataclass(slots=True)
class Settings:
    base_url: str = os.getenv("MADA_BASE_URL", "https://mda101.org")
    browser_headless: bool = os.getenv("MADA_HEADLESS", "true").lower() not in {
        "0",
        "false",
        "no",
    }
    browser_timeout_ms: int = int(os.getenv("MADA_TIMEOUT_MS", "45000"))
    frontend_origins: list[str] = None  # type: ignore[assignment]

    def __post_init__(self) -> None:
        if self.frontend_origins is None:
            self.frontend_origins = _split_csv(
                os.getenv("MADA_FRONTEND_ORIGINS", "http://localhost:5173,http://127.0.0.1:5173")
            )


settings = Settings()
