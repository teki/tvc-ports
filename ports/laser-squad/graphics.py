#!/usr/bin/env python3
"""Offline ZX Spectrum to TVC GRAPHICS 4 asset conversion."""

from __future__ import annotations


LSCODE_ADDR = 0x5E28
SCENARIO_ADDR = 0xB621

FONT_FIRST = 0x20
FONT_COUNT = 0x60
FONT_SOURCE_BASE = 0xB139
FONT_SOURCE_ADDR = FONT_SOURCE_BASE + FONT_FIRST * 8
FONT_SOURCE_SIZE = FONT_COUNT * 8
FONT_NATIVE_SIZE = FONT_COUNT * 16

LARGE_SOURCE_ADDR = 0xE8DF
LARGE_GLYPH_COUNT = 185
LARGE_SOURCE_SIZE = LARGE_GLYPH_COUNT * 32
LARGE_NATIVE_SIZE = LARGE_GLYPH_COUNT * 64
LARGE_DESCRIPTOR_ADDR = 0xE79F
LARGE_DESCRIPTOR_SIZE = LARGE_GLYPH_COUNT * 2
LARGE_LOW_GLYPHS = 89
LARGE_LOW_SIZE = LARGE_LOW_GLYPHS * 64
LARGE_HIGH_SIZE = LARGE_NATIVE_SIZE - LARGE_LOW_SIZE

SLOT_PATTERNS = (0x00, 0xF0, 0x0F, 0xFF)


def convert_bitmap_byte(value: int) -> bytes:
    """Expand eight 1-bit pixels to two native slot-3 GRAPHICS 4 bytes."""
    high = (value >> 4) & 0x0F
    low = value & 0x0F
    return bytes(((high << 4) | high, (low << 4) | low))


def convert_bitmap(data: bytes) -> bytes:
    """Convert packed Spectrum rows to interleaved native TVC row bytes."""
    output = bytearray()
    for value in data:
        output.extend(convert_bitmap_byte(value))
    return bytes(output)


def convert_large_glyph(data: bytes) -> bytes:
    """Convert one quadrant-ordered 16x16 glyph to four bytes per scanline."""
    if len(data) != 32:
        raise ValueError("large glyph must contain four 8-byte quadrants")
    output = bytearray()
    for left, right in ((0, 8), (16, 24)):
        for row in range(8):
            output.extend(convert_bitmap_byte(data[left + row]))
            output.extend(convert_bitmap_byte(data[right + row]))
    if len(output) != 64:
        raise ValueError("unexpected converted large-glyph size")
    return bytes(output)


def colorize_native(native: bytes, ink_slot: int, paper_slot: int = 0) -> bytes:
    """Resolve slot-3/slot-0 native masks to one ink/paper slot pair."""
    if not 0 <= ink_slot < len(SLOT_PATTERNS):
        raise ValueError("ink slot must be between 0 and 3")
    if not 0 <= paper_slot < len(SLOT_PATTERNS):
        raise ValueError("paper slot must be between 0 and 3")
    ink = SLOT_PATTERNS[ink_slot]
    paper = SLOT_PATTERNS[paper_slot]
    delta = ink ^ paper
    return bytes(paper ^ (value & delta) for value in native)


def extract_main_font(lscode: bytes) -> bytes:
    """Extract and convert printable 20H-7FH glyphs from pristine LSCODE."""
    start = FONT_SOURCE_ADDR - LSCODE_ADDR
    end = start + FONT_SOURCE_SIZE
    if start < 0 or end > len(lscode):
        raise ValueError("main font lies outside the LSCODE payload")
    native = convert_bitmap(lscode[start:end])
    if len(native) != FONT_NATIVE_SIZE:
        raise ValueError("unexpected converted main-font size")
    return native


def extract_large_graphics(scenario: bytes) -> bytes:
    """Extract and convert all addressable E8DFH large-glyph rows."""
    start = LARGE_SOURCE_ADDR - SCENARIO_ADDR
    end = start + LARGE_SOURCE_SIZE
    if start < 0 or end > len(scenario):
        raise ValueError("large graphics lie outside the scenario payload")
    source = scenario[start:end]
    native = b"".join(
        convert_large_glyph(source[offset:offset + 32])
        for offset in range(0, len(source), 32)
    )
    if len(native) != LARGE_NATIVE_SIZE:
        raise ValueError("unexpected converted large-graphics size")
    return native


def extract_descriptor_large_graphics(scenario: bytes) -> bytes:
    """Convert large glyphs in descriptor order, retaining neutral slot masks."""
    descriptor_start = LARGE_DESCRIPTOR_ADDR - SCENARIO_ADDR
    descriptor_end = descriptor_start + LARGE_DESCRIPTOR_SIZE
    source_start = LARGE_SOURCE_ADDR - SCENARIO_ADDR
    source_end = source_start + LARGE_SOURCE_SIZE
    if descriptor_start < 0 or descriptor_end > len(scenario):
        raise ValueError("large descriptor table lies outside the scenario payload")
    if source_start < 0 or source_end > len(scenario):
        raise ValueError("large graphics lie outside the scenario payload")

    descriptors = scenario[descriptor_start:descriptor_end]
    source = scenario[source_start:source_end]
    output = bytearray()
    for descriptor in range(LARGE_GLYPH_COUNT):
        glyph = descriptors[descriptor * 2 + 1]
        if glyph >= LARGE_GLYPH_COUNT:
            raise ValueError(
                f"large descriptor {descriptor:02X}H uses invalid glyph {glyph:02X}H"
            )
        glyph_start = glyph * 32
        output.extend(convert_large_glyph(source[glyph_start:glyph_start + 32]))
    if len(output) != LARGE_NATIVE_SIZE:
        raise ValueError("unexpected descriptor-native graphics size")
    return bytes(output)


def split_large_graphics(native: bytes) -> tuple[bytes, bytes]:
    if len(native) != LARGE_NATIVE_SIZE:
        raise ValueError("unexpected native large-graphics size")
    low = native[:LARGE_LOW_SIZE]
    high = native[LARGE_LOW_SIZE:]
    if len(high) != LARGE_HIGH_SIZE:
        raise ValueError("unexpected high native large-graphics size")
    return low, high
