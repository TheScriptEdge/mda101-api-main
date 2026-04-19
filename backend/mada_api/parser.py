from __future__ import annotations

from html import unescape
import re
from typing import Iterable

from bs4 import BeautifulSoup, Tag

from .models import (
    CalendarDay,
    CalendarNav,
    CalendarState,
    ShiftBlock,
    ShiftBoard,
    ShiftData,
    ShiftSlot,
    SlotAction,
    SlotDetails,
)


POSTBACK_RE = re.compile(r"__doPostBack\('([^']+)','([^']*)'\)")
SLOT_ACTION_RE = re.compile(r"(shibutzClick|removeClick|removeWarnClick)\('([^']+)'(?:,\s*(\d+))?\)")
STYLE_COLOR_RE = re.compile(r"background-color\s*:\s*([^;]+)")
WHITESPACE_RE = re.compile(r"\s+")


def clean_text(value: str | None) -> str | None:
    if value is None:
        return None
    normalized = WHITESPACE_RE.sub(" ", value.replace("\xa0", " ")).strip()
    return normalized or None


def parse_postback(href: str | None, *, label: str, action_type: str = "calendar") -> SlotAction | None:
    if not href:
        return None
    match = POSTBACK_RE.search(href)
    if not match:
        return None
    target, argument = match.groups()
    return SlotAction(type=action_type, label=label, target=target, argument=argument)


def parse_slot_details(title_html: str | None, base_url: str) -> SlotDetails | None:
    if not title_html:
        return None

    fragment = BeautifulSoup(unescape(title_html), "lxml")
    lines = [line.strip() for line in fragment.get_text("\n").splitlines() if line.strip()]
    if not lines:
        return None

    details = SlotDetails(display_name=clean_text(lines[0]))
    for line in lines[1:]:
        if line.startswith("טלפון:"):
            details.phone = clean_text(line.removeprefix("טלפון:"))
        elif line.startswith("שובץ למשמרת בתאריך:"):
            details.assigned_at = clean_text(line.removeprefix("שובץ למשמרת בתאריך:"))
        elif line.startswith("שובץ על ידי:"):
            details.assigned_by = clean_text(line.removeprefix("שובץ על ידי:"))
        elif not details.qualification:
            details.qualification = clean_text(line)

    image = fragment.find("img")
    if isinstance(image, Tag) and image.get("src"):
        src = image["src"].lstrip("./")
        details.image_url = f"{base_url.rstrip('/')}/{src}"

    return details


def _extract_color(style: str | None) -> str | None:
    if not style:
        return None
    match = STYLE_COLOR_RE.search(style)
    return clean_text(match.group(1)) if match else None


def _slot_actions(div: Tag) -> list[SlotAction]:
    onclick = div.get("onclick") or div.get("OnClick")
    if not onclick:
        return []

    match = SLOT_ACTION_RE.search(onclick)
    if not match:
        return []

    function_name, action_id, _ = match.groups()
    if function_name == "shibutzClick":
        return [SlotAction(type="claim", label="Claim slot", argument=action_id)]
    if function_name == "removeClick":
        return [
            SlotAction(
                type="cancel",
                label="Cancel slot",
                argument=f"R{action_id}",
                reason_required=True,
            )
        ]
    if function_name == "removeWarnClick":
        return [SlotAction(type="cancel_with_warning", label="Cancel slot", argument=f"R{action_id}")]
    return []


def _slot_status(text: str | None, actions: Iterable[SlotAction]) -> str:
    if text:
        return "occupied"
    for action in actions:
        if action.type == "claim":
            return "available"
        if action.type in {"cancel", "cancel_with_warning"}:
            return "occupied"
    return "locked"


def _parse_shift_slot(role: str, div: Tag, base_url: str) -> ShiftSlot:
    text = clean_text(div.get_text(" ", strip=True))
    actions = _slot_actions(div)
    details = parse_slot_details(div.get("title"), base_url)
    return ShiftSlot(
        role=role,
        status=_slot_status(text, actions),
        color=_extract_color(div.get("style")),
        text=text,
        details=details,
        actions=actions,
        classes=[class_name for class_name in div.get("class", []) if class_name != "calDivHor"],
    )


def _parse_board_tables(tables: list[Tag], base_url: str) -> list[ShiftBoard]:
    if len(tables) < 2:
        return []

    key_table = tables[0]
    role_labels = [
        clean_text(div.get_text(" ", strip=True)) or f"Slot {index + 1}"
        for index, div in enumerate(key_table.select("div.keyDivHor"))
    ]

    boards: list[ShiftBoard] = []
    for table in tables[1:]:
        header_div = table.select_one("div.nameDivHor, div.nameDivHorOved, div.keyHeaderDivHor")
        board_name = clean_text(header_div.get_text(" ", strip=True) if header_div else "Unknown board") or "Unknown board"
        variant = None
        if isinstance(header_div, Tag):
            classes = header_div.get("class", [])
            variant = next((class_name for class_name in classes if class_name not in {"nameDivHor", "nameDivHorOved", "keyHeaderDivHor"}), None)

        rows = table.select("tr.calRow")
        slots: list[ShiftSlot] = []
        for index, row in enumerate(rows):
            role = role_labels[index] if index < len(role_labels) else f"Slot {index + 1}"
            div = row.select_one("div.calDivHor")
            if isinstance(div, Tag):
                slots.append(_parse_shift_slot(role, div, base_url))

        boards.append(ShiftBoard(name=board_name, variant=variant, slots=slots))

    return boards


def parse_calendar(soup: BeautifulSoup) -> CalendarState | None:
    calendar = soup.select_one("#ctl00_ContentPlaceHolder1_calWeek")
    if not isinstance(calendar, Tag):
        return None

    title_cell = calendar.select_one(".newCalTitle tr td:nth-child(2)")
    previous_anchor = calendar.select_one(".newCalTitle tr td:nth-child(1) a")
    next_anchor = calendar.select_one(".newCalTitle tr td:nth-child(3) a")

    days: list[CalendarDay] = []
    for day_cell in calendar.select("td.newCalDays"):
        anchor = day_cell.find("a")
        label = clean_text(anchor.get_text(" ", strip=True) if anchor else day_cell.get_text(" ", strip=True))
        if not label:
            continue
        style = (day_cell.get("style") or "") + " " + (anchor.get("style") if isinstance(anchor, Tag) else "")
        selected = "#91A6FF" in style or "font-weight:bold" in style.replace(" ", "").lower()
        current_month = "color:Gray" not in style.replace(" ", "")
        title = anchor.get("title") if isinstance(anchor, Tag) else None
        days.append(
            CalendarDay(
                label=label,
                title=clean_text(title),
                selected=selected,
                current_month=current_month,
                action=parse_postback(anchor.get("href") if isinstance(anchor, Tag) else None, label=label),
            )
        )

    previous = None
    if isinstance(previous_anchor, Tag):
        action = parse_postback(previous_anchor.get("href"), label="Previous")
        if action:
            previous = CalendarNav(label="Previous", action=action)

    next_nav = None
    if isinstance(next_anchor, Tag):
        action = parse_postback(next_anchor.get("href"), label="Next")
        if action:
            next_nav = CalendarNav(label="Next", action=action)

    return CalendarState(
        month_label=clean_text(title_cell.get_text(" ", strip=True) if isinstance(title_cell, Tag) else None),
        previous=previous,
        next=next_nav,
        days=days,
    )


def parse_shift_page(html: str, base_url: str) -> ShiftData:
    soup = BeautifulSoup(html, "lxml")

    shift_blocks: list[ShiftBlock] = []
    for shift_cell in soup.select("#ctl00_ContentPlaceHolder1_tblShibutz > tr > td[class^='multshift_Div']"):
        cal_table = shift_cell.select_one("table.calTable")
        if not isinstance(cal_table, Tag):
            continue

        title_container = cal_table.select_one("td.dayCol")
        if not isinstance(title_container, Tag):
            continue

        title_divs = title_container.find_all("div", recursive=False)
        title = clean_text(title_divs[0].get_text(" ", strip=True) if title_divs else title_container.get_text(" ", strip=True))
        subtitle = None
        if len(title_divs) > 1:
            subtitle = clean_text(title_divs[1].get_text(" ", strip=True))

        content_rows = cal_table.find_all("tr", recursive=False)
        if len(content_rows) < 2:
            continue

        content_tables = content_rows[1].find_all("table", recursive=False)
        if not content_tables:
            content_tables = [
                child
                for td in content_rows[1].find_all("td", recursive=False)
                for child in td.find_all("table", recursive=False)
            ]

        boards = _parse_board_tables(content_tables, base_url)
        if not boards:
            continue

        shift_blocks.append(ShiftBlock(title=title or "Shift", subtitle=subtitle, boards=boards))

    return ShiftData(
        page_title=clean_text(soup.title.get_text(" ", strip=True) if soup.title else None),
        shift_type_title=clean_text(_text_from_id(soup, "ctl00_ContentPlaceHolder1_dvShibutzTypeTitle")),
        shift_type_message=clean_text(_text_from_id(soup, "ctl00_ContentPlaceHolder1_dvShibutzTypeMsg")),
        month_title=clean_text(_text_from_id(soup, "ctl00_ContentPlaceHolder1_lblTitle")),
        calendar=parse_calendar(soup),
        shift_blocks=shift_blocks,
    )


def _text_from_id(soup: BeautifulSoup, element_id: str) -> str | None:
    element = soup.select_one(f"#{element_id}")
    if not isinstance(element, Tag):
        return None
    return element.get_text(" ", strip=True)
