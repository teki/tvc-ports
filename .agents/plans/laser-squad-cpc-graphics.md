# Laser Squad CPC Map Graphics and Palette

## Scope

Replace the Spectrum-derived 16-by-16 map tiles, unit sprites, and object
glyphs with the pre-coloured Amstrad CPC tiles. Show them in one fixed TVC
GRAPHICS 4 palette: black, bright red, bright magenta, and bright white. The
original Spectrum program, map layout, 11-by-11 map window, game logic, and
data stay unchanged. Only the native tile cache and the palette change.

This is an intentional exception to the port rule that keeps original
graphics. The user approved the CPC art and the red/magenta palette on
2026-10-16, after comparing a mock-up of four palettes.

## Findings (2026-10-16, scenario 1, CPC deployment screen)

- The CPC game runs in mode 1 with fixed pens: 0 black, 1 pink, 2 pastel
  magenta, 3 bright white. They are the same on every screen from the language
  menu to deployment. The menus briefly use pastel blue as pen 3.
- The CPC mode 1 byte layout is identical to TVC GRAPHICS 4:
  `pixel n = (bit (3-n) << 1) | bit (7-n)`. CPC tile bytes can therefore be
  copied to TVC VRAM unchanged.
- In the CPC RAM, the tile table starts at `953FH` and holds 64-byte tiles.
  Each tile is sixteen 4-byte scanlines, the same layout as the port's native
  tile cache. The table has 171 entries (`953FH-BFFEH`) and ends exactly at
  CPC screen memory.
- CPC tile `i` corresponds to Spectrum `E79FH` descriptor/glyph `i` for most
  indices. 99 of 171 tiles have an identical lit-pixel mask, and many of the
  others differ only by small CPC touch-ups.
- Exceptions need a mapping, not an index copy:
  - indices 1, 12, 44, 54, 55, 101-105, and 138-141 hold different art;
  - CPC 12 and 142 are red and magenta team `D` fields, and the soldier
    sprites are red (106-121) or magenta (122-137). The Spectrum gets the same
    team distinction from attributes, so attribute-coloured duplicates may
    need their own CPC tile;
  - Spectrum glyphs 171-184 (smoke, grass edges, terminal, key, and other
    objects) are outside the CPC table and still need to be located.
- Pen 1 (pink) becomes TVC bright red and pen 2 (pastel magenta) becomes TVC
  bright magenta. No palette profiles are needed for the map.
- Single-buffered drawing: CRTC R12/R13 stayed at `C000H`, and RAM held no
  second copy of the map. A deployment scroll redraw took under 0.1 s on the
  CPC and about 1.5 s on the current TVC build at equal emulator speed. The
  TVC slowness is a separate draw-path issue; see the validation step below.

Reproduce with rtvc, run from the `rtvc` checkout so `roms/` resolves:
`rtvc --cpc -H -p 8091 -t <cdt>`, type `run"` and a key, enable `warp`, then
press `1` (English), `1` (scenario), `2`, `1`, `1`, Space x5, `P`, Space x2.

Implementation differs from the first draft in two places: the Gxx files
carry a CPC tile table plus lookup pages instead of descriptor-ordered tiles,
and each scenario uses its own CPC palette (scenario 2 is blue/cyan on the
CPC). See [the progress file](laser-squad-cpc-graphics-progress.md).

## Open Questions

Resolved 2026-10-16: the CPC media is CPCRulez `Laser_Squad__ENGLISH.zip`
(<https://cpcrulez.fr/f/p9d>), whose Side B supplies scenario 3 and the
expansion. The text font stays Spectrum, and the menus use the scenario
palette.

## Implementation Order

1. Add the CPC tape to `port.toml` and `prepare.py` as a verified secondary
   source (URL, archive, member, SHA-256), ignored like the TAP.
2. Extract each scenario's CPC tile table from the tape, either from its
   load blocks or from a deterministic emulator run, whichever is
   reproducible in `prepare.py`/`build.py` without committing CPC data.
3. Build a Spectrum-index-to-CPC-tile map per scenario. Start from the index
   identity, then resolve the exceptions above by shape and attribute. Review
   the remaining mismatches visually with a contact sheet.
4. Generate the `G6x` companions from CPC tiles instead of converted Spectrum
   glyphs. Keep the same 185-entry, 11,840-byte allocation and the two-range
   load.
5. Remove the runtime palette rebuild for the map cache (tiles are already
   coloured). Set ports `60H-63H` to black, bright red, bright magenta, and
   bright white.
6. Re-time the deployment and tactical scrolls (`6181H`, `646CH`, `64B0H`) and
   find out why the deployment scroll misses the fast cached path.

## Validation

1. `python3 verify.py`.
2. A contact sheet of every scenario's final tile cache against both sources.
3. Screenshots of deployment, tactical map, unit information, hidden movement,
   and the firing view, with team colours distinguishable (red vs magenta).
4. Draw-timing probe: map redraw no slower than the current cached path.
