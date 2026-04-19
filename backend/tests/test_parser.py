from pathlib import Path

from mada_api.parser import parse_shift_page


FIXTURE = Path(__file__).resolve().parents[2] / "mda101.org.Shibutz.aspx" / "Shibutz.aspx"


def test_parse_shift_page_extracts_real_blocks() -> None:
    html = FIXTURE.read_text(encoding="utf-8")
    data = parse_shift_page(html, "https://mda101.org")

    assert data.shift_type_title
    assert data.month_title
    assert data.calendar is not None
    assert data.calendar.days
    assert data.shift_blocks

    first_block = data.shift_blocks[0]
    assert first_block.title
    assert first_block.boards
    assert first_block.boards[0].slots


def test_parser_marks_available_and_occupied_slots() -> None:
    html = FIXTURE.read_text(encoding="utf-8")
    data = parse_shift_page(html, "https://mda101.org")

    statuses = {
        slot.status
        for block in data.shift_blocks
        for board in block.boards
        for slot in board.slots
    }

    assert "available" in statuses
    assert "occupied" in statuses
