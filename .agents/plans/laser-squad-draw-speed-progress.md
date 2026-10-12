# Laser Squad drawing speed: progress

## Status

All planned changes except the raw-glyph memo are implemented. The memo was
dropped because the writers of the `E8DFH` glyph data are unaudited. Every
draw-timing scenario matches the pre-pass output byte for byte. `verify.py`
passes. Manual in-game checks remain.

## Completed

1. The firing clear uses the temporary-screen guard (no tile-cache rebuild on
   firing entry or exit).
2. A U0 plotter uses `B239H` pairs. Mode 3 now sets, as in the original.
3. `616EH` is routed through the descriptor lookup (`TVC_DRAW_TILE`).
4. The `PUSH` clear and the `B239H` rebuild only on palette change.
5. Raw-glyph conversion uses a `B000H` VID0 nibble table that is rebuilt only
   when the ink/paper pair changes.
6. Shared `TVC_TEXT_CELL` and inline-colored normal and double-height loops.
   The slot-1/slot-2 font variants and their direct and safe copiers were
   removed, and `LOADER.CAS` went from 7,793 to 4,047 bytes.
7. Not in the original plan: the tile lookup, attribute writes, and a looped
   scanline copier moved to U0. The shared `TVC_CELL_ADDRESS` replaced
   `TVC_ATTRIBUTE_DEST` and `TVC_VIDEO_DEST`. 50 bytes of U0 support space
   remain below `2880H`.

## Results (wall clock; Spectrum / before / now)

- Clear: 41.5 / 112.6 / 33.9 ms.
- `612AH` map: 71.9 / 105.9 / 88.6 ms.
- `6181H` map: 72.4 / 454.9 / 96.5 ms.
- Firing view: 960 / 3606 / 1372 ms.
- Double-height text: 945 / 5,851 / 2,150 T.
- Raw glyph: 1,850 / 11,504 / 9,474 T.

The full table is in `ports/laser-squad/notes.md` (Drawing speed pass).

## Validation run

- `draw_timing.py --compare build/draw-baseline`: 13 of 13 identical.
- `plot_sweep.py` (600 cases): modes 0-2 identical.
- `verify.py`: passed, with LOADER and LS2 hashes and the LOADER size updated.
- A headless real-disk boot reached the team/armour screen correctly. The
  hidden code was intact across the scenario multi-load.

## Next

- Manual play: scroll in all directions, cursor blink and movement, firing
  view, unit information, and text highlights.
- Optional: further firing-view gains would need batching the per-pixel VID0
  map and restore, which means changing the original plot loop. Not planned
  without approval.
