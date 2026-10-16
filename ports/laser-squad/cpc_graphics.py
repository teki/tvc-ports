#!/usr/bin/env python3
"""Build-time Amstrad CPC map graphics for the Laser Squad TVC port.

The CPC release keeps pre-coloured mode 1 tiles whose byte layout is the TVC
GRAPHICS 4 layout, so its tiles are copied unchanged. Each derived Gxx file
holds a tile table plus three lookup pages used by the TVC tile renderer.
"""

from __future__ import annotations

from pathlib import Path

from graphics import (
    LARGE_DESCRIPTOR_ADDR,
    LARGE_GLYPH_COUNT,
    LARGE_HIGH_SIZE,
    LARGE_LOW_SIZE,
    LARGE_NATIVE_SIZE,
    LARGE_SOURCE_ADDR,
    SCENARIO_ADDR,
    SLOT_PATTERNS,
    convert_large_glyph,
)


TILE_SIZE = 64
LOW_TILES = LARGE_LOW_SIZE // TILE_SIZE          # 89 tiles at 2880H
MAX_TILES = 171                                 # CPC table size
TEMP_DESCRIPTOR_ADDR = 0xE65F
TEMP_DESCRIPTOR_COUNT = 160

# Lookup pages in the high native range (4000H-57FFH). Tiles 89-170 end at
# 547FH; each page is indexed by the low byte only.
HIGH_RUN = 0x4000
PALETTE_RUN = 0x5480        # four TVC palette bytes for ports 60H-63H
MAP_COLUMN_RUN = 0x5500     # E79FH descriptor -> tile
TEMP_COLUMN_RUN = 0x5600    # E65FH descriptor -> tile, or USE_GLYPH
GLYPH_MAP_RUN = 0x5700      # live Spectrum glyph -> tile, or RAW_GLYPH
USE_GLYPH = 0xFE
RAW_GLYPH = 0xFF

# CPC scenario blocks are Spectrum-style turbo blocks: flag, data, XOR
# checksum. The custom loader stores bytes downward from the end address, so
# the payload is reversed; every scenario loads at 6369H. Side A carries 64H
# and 65H, Side B 66H, 68H, and 69H.
CPC_SCENARIO_ADDR = 0x6369
CPC_TEMP_COLUMN_ADDR = 0x93FF
CPC_MAP_COLUMN_ADDR = 0x949F
CPC_TILE_ADDR = 0x953F
CPC_PALETTE_ADDR = 0x644E   # Gate Array colours for pens 1-3; pen 0 is black

# Fixed CPC hardware colour -> TVC palette byte (bit 6 intensity, 4 green,
# 2 red, 0 blue). The scenario 1 choices (pink -> bright red, pastel magenta
# -> bright magenta) were picked by the user; pastel blue and cyan keep their
# hue for scenario 2. Other colours are matched per scenario by tvc_palette.
CPC_TO_TVC_COLOR = {
    0x54: 0x00,  # black
    0x47: 0x44,  # pink -> bright red
    0x4F: 0x45,  # pastel magenta -> bright magenta
    0x4B: 0x55,  # bright white
    0x5F: 0x41,  # pastel blue -> bright blue
    0x46: 0x11,  # cyan (half-level teal) -> dim cyan
}
DEFAULT_PALETTE = bytes((0x00, 0x44, 0x45, 0x55))

# Spectrum ink -> palette slot for the fixed black/red/magenta/white palette,
# matching how the CPC release colours the same screens.
INK_SLOTS = (0, 2, 1, 1, 2, 2, 3, 3)

# Largest lit-pixel difference accepted when matching a Spectrum glyph to a
# CPC tile for raw 60AFH callers and live unit sprites.
GLYPH_MATCH_LIMIT = 16


def read_cdt_blocks(path: Path) -> list[bytes]:
    """Return the data of each TZX/CDT standard or turbo data block."""
    data = path.read_bytes()
    if not data.startswith(b"ZXTape!\x1a"):
        raise ValueError(f"{path.name} is not a TZX/CDT image")
    offset = 10
    blocks = []
    while offset < len(data):
        block_id = data[offset]
        if block_id == 0x10:
            length = int.from_bytes(data[offset + 3:offset + 5], "little")
            start = offset + 5
        elif block_id == 0x11:
            length = int.from_bytes(data[offset + 16:offset + 19], "little")
            start = offset + 19
        elif block_id == 0x20:
            offset += 3
            continue
        elif block_id == 0x30:
            offset += 2 + data[offset + 1]
            continue
        else:
            raise ValueError(f"unsupported CDT block {block_id:02X}H")
        blocks.append(data[start:start + length])
        offset = start + length
    return blocks


def read_cpc_scenario(paths: list[Path], flag: int) -> bytes | None:
    """Return the memory image of the scenario block with this flag, if present."""
    for block in (block for path in paths for block in read_cdt_blocks(path)):
        if not block or block[0] != flag:
            continue
        checksum = 0
        for value in block[:-1]:
            checksum ^= value
        if checksum != block[-1]:
            raise ValueError(f"CPC scenario {flag:02X}H checksum mismatch")
        return block[1:-1][::-1]
    return None


def _spectrum_glyph(scenario: bytes, glyph: int) -> bytes:
    start = LARGE_SOURCE_ADDR - SCENARIO_ADDR + glyph * 32
    return scenario[start:start + 32]


def _spectrum_mask(glyph: bytes) -> list[int]:
    rows = []
    for top in (0, 16):
        for row in range(8):
            rows.append((glyph[top + row] << 8) | glyph[top + 8 + row])
    return rows


def _native_mask(tile: bytes) -> list[int]:
    rows = []
    for line in range(16):
        value = 0
        for byte in tile[line * 4:line * 4 + 4]:
            value = (value << 4) | ((byte | (byte >> 4)) & 0x0F)
        rows.append(value)
    return rows


def _mask_distance(left: list[int], right: list[int]) -> int:
    return sum((a ^ b).bit_count() for a, b in zip(left, right))


def _descriptors(scenario: bytes, address: int, count: int) -> list[tuple[int, int]]:
    start = address - SCENARIO_ADDR
    table = scenario[start:start + count * 2]
    return [(table[index * 2], table[index * 2 + 1]) for index in range(count)]


def _colorize(native: bytes, attribute: int) -> bytes:
    ink = INK_SLOTS[attribute & 7]
    paper = INK_SLOTS[(attribute >> 3) & 7]
    if paper and ink == paper:
        ink = 0
    delta = SLOT_PATTERNS[ink] ^ SLOT_PATTERNS[paper]
    return bytes(SLOT_PATTERNS[paper] ^ (value & delta) for value in native)


def _glyph_map(
    scenario: bytes, tiles: list[bytes], pairs: list[tuple[int, int]]
) -> bytes:
    """Map each Spectrum glyph to a tile for raw draws and live unit glyphs.

    Prefer the tile the CPC descriptor columns pair with that glyph (its own
    number first), then the closest lit-pixel shape.
    """
    masks = [_native_mask(tile) for tile in tiles]
    result = bytearray([RAW_GLYPH] * 256)
    result[0] = 0
    for glyph in range(1, LARGE_GLYPH_COUNT):
        source = _spectrum_mask(_spectrum_glyph(scenario, glyph))
        if not any(source):
            result[glyph] = 0
            continue
        paired = [tile for spectrum, tile in pairs if spectrum == glyph and tile]
        if paired:
            result[glyph] = glyph if glyph in paired else max(
                set(paired), key=lambda tile: (paired.count(tile), -tile)
            )
            continue
        best = None
        for tile, mask in enumerate(masks):
            if tile == 0:
                continue
            distance = _mask_distance(source, mask)
            key = (distance, tile != glyph, tile)
            if best is None or key < best[0]:
                best = (key, tile)
        if best and best[0][0] <= GLYPH_MATCH_LIMIT:
            result[glyph] = best[1]
    return bytes(result)


def _cpc_rgb(color: int) -> tuple[int, int, int]:
    """Return the 0/1/2 channel levels of a CPC Gate Array hardware colour."""
    firmware = (
        13, 13, 19, 25, 1, 7, 10, 16, 7, 25, 24, 26, 6, 8, 15, 17,
        1, 19, 18, 20, 0, 2, 9, 11, 4, 22, 21, 23, 3, 5, 12, 14,
    )[color & 0x1F]
    return firmware // 3 % 3, firmware // 9, firmware % 3  # red, green, blue


def _tvc_rgb(byte: int) -> tuple[int, int, int]:
    level = 0xFF if byte & 0x40 else 0x7F
    return tuple(level if byte & bit else 0 for bit in (0x04, 0x10, 0x01))


# The 15 non-black TVC colours.
TVC_COLORS = tuple(
    intensity | green | red | blue
    for intensity in (0x00, 0x40) for green in (0x00, 0x10)
    for red in (0x00, 0x04) for blue in (0x00, 0x01)
    if green | red | blue
) + (0x40,)


def _distance(color: int, byte: int) -> int:
    """Squared RGB distance between a CPC and a TVC colour. Unweighted, so
    hue wins over brightness (olive maps to dim yellow, not grey)."""
    cpc = tuple((0, 0x80, 0xFF)[level] for level in _cpc_rgb(color))
    return sum((a - b) ** 2 for a, b in zip(cpc, _tvc_rgb(byte)))


def tvc_palette(colors: bytes) -> bytes:
    """Map CPC pens 1-3 to distinct TVC colours; pen 0 stays black.

    Fixed mappings come from CPC_TO_TVC_COLOR; the remaining pens take the
    combination of unused colours with the smallest total distance.
    """
    fixed = [CPC_TO_TVC_COLOR.get(color) for color in colors]
    free = [index for index, value in enumerate(fixed) if value is None]
    used = {0x00} | {value for value in fixed if value is not None}
    best = None

    def search(position, chosen, cost):
        nonlocal best
        if position == len(free):
            if best is None or cost < best[0]:
                best = (cost, list(chosen))
            return
        color = colors[free[position]]
        for byte in TVC_COLORS:
            if byte not in used and byte not in chosen:
                search(position + 1, chosen + [byte], cost + _distance(color, byte))

    search(0, [], 0)
    for index, byte in zip(free, best[1]):
        fixed[index] = byte
    return bytes([0x00] + fixed)


def cpc_palette(cpc: bytes) -> bytes:
    start = CPC_PALETTE_ADDR - CPC_SCENARIO_ADDR
    return tvc_palette(cpc[start:start + 3])


def cpc_tile_set(scenario: bytes, cpc: bytes) -> tuple[list[bytes], bytes, bytes, bytes]:
    """Use the CPC tiles and lookup columns for one scenario."""
    def cpc_bytes(address: int, size: int) -> bytes:
        start = address - CPC_SCENARIO_ADDR
        return cpc[start:start + size]

    tiles = [bytes(TILE_SIZE)] + [
        cpc_bytes(CPC_TILE_ADDR + tile * TILE_SIZE, TILE_SIZE)
        for tile in range(1, MAX_TILES)
    ]
    map_column = cpc_bytes(CPC_MAP_COLUMN_ADDR, LARGE_GLYPH_COUNT)
    temp_cpc = cpc_bytes(CPC_TEMP_COLUMN_ADDR, TEMP_DESCRIPTOR_COUNT)

    # The CPC copy of the scenario must describe the same map as the
    # Spectrum one; most descriptor glyphs keep their numbers.
    spectrum_map = [glyph for _, glyph in _descriptors(
        scenario, LARGE_DESCRIPTOR_ADDR, LARGE_GLYPH_COUNT)]
    same = sum(1 for a, b in zip(spectrum_map, map_column) if a == b)
    if same < LARGE_GLYPH_COUNT * 3 // 4:
        raise ValueError("CPC scenario does not match the Spectrum descriptors")

    temp_glyphs = [glyph for _, glyph in _descriptors(
        scenario, TEMP_DESCRIPTOR_ADDR, TEMP_DESCRIPTOR_COUNT)]
    pairs = [
        (glyph, tile)
        for glyph, tile in zip(spectrum_map + temp_glyphs, map_column + temp_cpc)
        if tile < MAX_TILES
    ]
    glyph_map = _glyph_map(scenario, tiles, pairs)
    # Entries past the CPC table (scenario 2's 171) follow the glyph map. In
    # E65FH, 6D10H also rewrites unit glyphs at run time: an entry whose static
    # CPC tile is what its glyph maps to follows those writes.
    map_column = bytes(
        USE_GLYPH if tile >= MAX_TILES else tile for tile in map_column
    )
    temp_column = bytes(
        USE_GLYPH if tile >= MAX_TILES or glyph_map[glyph] == tile else tile
        for glyph, tile in zip(temp_glyphs, temp_cpc)
    )
    return tiles, map_column, temp_column, glyph_map


def spectrum_tile_set(scenario: bytes) -> tuple[list[bytes], bytes, bytes, bytes]:
    """Fixed-palette Spectrum tiles for scenarios without CPC media."""
    tiles = [bytes(TILE_SIZE)]
    index: dict[bytes, int] = {}

    def tile_for(attribute: int, glyph: int) -> int:
        tile = _colorize(convert_large_glyph(_spectrum_glyph(scenario, glyph)), attribute)
        if not any(tile):
            return 0
        if tile not in index:
            if len(tiles) >= MAX_TILES:
                raise ValueError("Spectrum fallback needs more than 171 tiles")
            index[tile] = len(tiles)
            tiles.append(tile)
        return index[tile]

    map_column = bytes(
        tile_for(attribute, glyph)
        for attribute, glyph in _descriptors(
            scenario, LARGE_DESCRIPTOR_ADDR, LARGE_GLYPH_COUNT)
    )
    temp_column = bytes([USE_GLYPH] * TEMP_DESCRIPTOR_COUNT)
    glyph_map = bytes([0] + [RAW_GLYPH] * 255)
    while len(tiles) < MAX_TILES:
        tiles.append(bytes(TILE_SIZE))
    return tiles, map_column, temp_column, glyph_map


def build_native_graphics(scenario: bytes, cpc: bytes | None) -> tuple[bytes, bytes]:
    """Return the U0 low and U1 high images loaded from one Gxx file."""
    if cpc is None:
        tiles, map_column, temp_column, glyph_map = spectrum_tile_set(scenario)
        palette = DEFAULT_PALETTE
    else:
        tiles, map_column, temp_column, glyph_map = cpc_tile_set(scenario, cpc)
        palette = cpc_palette(cpc)
    if len(tiles) != MAX_TILES or any(len(tile) != TILE_SIZE for tile in tiles):
        raise ValueError("unexpected tile table shape")
    low = b"".join(tiles[:LOW_TILES])
    high = bytearray(LARGE_HIGH_SIZE)
    tiles_high = b"".join(tiles[LOW_TILES:])
    high[:len(tiles_high)] = tiles_high
    if HIGH_RUN + len(tiles_high) > PALETTE_RUN:
        raise ValueError("high tiles overlap the lookup pages")
    for run, page in (
        (PALETTE_RUN, palette),
        (MAP_COLUMN_RUN, map_column),
        (TEMP_COLUMN_RUN, temp_column),
        (GLYPH_MAP_RUN, glyph_map),
    ):
        offset = run - HIGH_RUN
        high[offset:offset + len(page)] = page
    if len(low) != LARGE_LOW_SIZE or len(high) != LARGE_HIGH_SIZE:
        raise ValueError("unexpected native graphics split")
    if len(low) + len(high) != LARGE_NATIVE_SIZE:
        raise ValueError("unexpected native graphics size")
    return low, bytes(high)
