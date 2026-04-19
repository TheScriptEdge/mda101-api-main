from __future__ import annotations

from typing import Literal

from pydantic import BaseModel, Field


ActionType = Literal[
    "claim",
    "cancel",
    "cancel_with_warning",
    "calendar",
]

SlotStatus = Literal["available", "occupied", "locked"]


class SlotAction(BaseModel):
    type: ActionType
    label: str
    target: str = "__Page"
    argument: str
    reason_required: bool = False


class SlotDetails(BaseModel):
    display_name: str | None = None
    qualification: str | None = None
    phone: str | None = None
    assigned_at: str | None = None
    assigned_by: str | None = None
    image_url: str | None = None


class ShiftSlot(BaseModel):
    role: str
    status: SlotStatus
    color: str | None = None
    text: str | None = None
    details: SlotDetails | None = None
    actions: list[SlotAction] = Field(default_factory=list)
    classes: list[str] = Field(default_factory=list)


class ShiftBoard(BaseModel):
    name: str
    variant: str | None = None
    slots: list[ShiftSlot]


class ShiftBlock(BaseModel):
    title: str
    subtitle: str | None = None
    boards: list[ShiftBoard]


class CalendarDay(BaseModel):
    label: str
    title: str | None = None
    selected: bool = False
    current_month: bool = True
    action: SlotAction | None = None


class CalendarNav(BaseModel):
    label: str
    action: SlotAction


class CalendarState(BaseModel):
    month_label: str | None = None
    previous: CalendarNav | None = None
    next: CalendarNav | None = None
    days: list[CalendarDay] = Field(default_factory=list)


class ShiftData(BaseModel):
    page_title: str | None = None
    shift_type_title: str | None = None
    shift_type_message: str | None = None
    month_title: str | None = None
    calendar: CalendarState | None = None
    shift_blocks: list[ShiftBlock]


class AuthResponse(BaseModel):
    success: bool = True
    session_id: str


class DataResponse(BaseModel):
    success: bool = True
    data: ShiftData


class SessionInfo(BaseModel):
    success: bool = True
    authenticated: bool = True
    session_id: str
    current_url: str


class PostbackRequest(BaseModel):
    session_id: str
    target: str = "__Page"
    argument: str
    action_type: ActionType
    reason: str | None = None


class ErrorResponse(BaseModel):
    success: bool = False
    detail: str
