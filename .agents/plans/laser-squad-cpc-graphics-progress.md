# Laser Squad CPC Graphics: Progress

## Status (2026-10-16)

Scenarios 1 and 2 use the CPC tiles, sprites, icons, and per-scenario palettes.
`verify.py` passes. Nothing is committed.
All four Gxx files now use CPC graphics.

## Done

- [cpc_graphics.py](../../ports/laser-squad/cpc_graphics.py): CDT parsing,
  CPC tile table (`953FH`), descriptor columns (`949FH`, `93FFH`), palette
  (`644EH`), glyph map, Spectrum fallback, and Gxx layout.
- Loader: three-way tile lookup, `60AFH` through the glyph map, one palette
  refreshed from each Gxx, rebuild code removed, scenario ID in `SAVE.CAS`.
- `prepare.py`/`port.toml`: the CDT is a required, hash-checked source.
- `verify.py`: G64/G65 checked tile by tile against the tape, G66/G68 against
  an independent fixed-palette conversion; new palette and hash baselines.
- Draw-timing probe installs a Gxx file; deployment (`E65FH`) map 100.6 ms.

## Validated In rtvc

- Scenario 1: armour, store, deployment (red Assassin squares, magenta droid
  squares), deploying five units, tactical map with red soldier sprites.
- Scenario 2: deployment matches the CPC 464 tile for tile in blue/cyan.
- Scenario 3: fallback Spectrum tiles in the scenario 1 palette.
- Save, then load after overwriting the tile ranges: tiles and palette restored.
- Deployment scroll about 0.1 s (was about 1.5 s).

- 2026-10-16 user report: bullets passed through walls and the aiming cross
  erased walls. The plotter now uses non-paper collision and reversible XOR;
  `plot_attribute_check.py` passes. Not yet replayed in a live fire mode.

- CDT source recorded (CPCRulez `f/p9d`); `prepare.py` downloads both sides.
  Side B gives CPC tiles and palettes for `G66` and `G68`; palettes are
  matched per scenario to distinct TVC colours.

## Next

1. Play-test scenario 3 and the expansion with the CPC tiles.
2. Block `69H` (Side B) has no TVC Gxx yet; the port still loads expansion
   blocks only through `68H` (see the repeated `68H` requests in notes).
3. Map frame and status bar still use Spectrum UDGs in white; the CPC draws
   them in pink.
4. Firing view: 1.37 s against 0.96 s on the Spectrum; profile the CPC
   firing view to see whether its plotter is worth adopting.
5. Exercise hidden movement, unit information, and firing screens with the
   new palette.
