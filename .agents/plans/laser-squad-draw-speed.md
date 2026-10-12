# Laser Squad drawing speed

Goal: bring the remaining slow TVC drawing paths closer to Spectrum speed
without changing game logic, data, or visible output.

## Baseline

`ports/laser-squad/experiments/draw-timing/draw_timing.py` times each
routine from `lsql-fire.rtvcsnap.zip` with the pristine `LSCODE` and with
the current build. Times are wall clock (Spectrum 3.5 MHz, TVC 3.125 MHz
including video waits).

| Path | Spectrum | TVC | Ratio |
| --- | ---: | ---: | ---: |
| `602CH` clear | 41.5 ms | 112.6 ms | 2.71 |
| `612AH` 121-tile map | 71.9 ms | 105.9 ms | 1.47 |
| `6181H` 121-tile map (also `646CH`, `64B0H`) | 72.4 ms | 454.9 ms | 6.28 |
| `616EH` one tile | 0.6 ms | 3.7 ms | 6.63 |
| `60AFH` raw glyph (map cursor) | 0.5 ms | 3.7 ms | 6.96 |
| `6072H` text, black / inverse | 0.2 ms | 0.4 / 0.8 ms | 2.4 / 4.5 |
| `64F7H` double-height text | 0.3 ms | 1.9 ms | 6.93 |
| `8444H` pixel plot | 0.08 ms | 0.5 ms | 6.1-6.7 |
| `8495H` firing view draw | 960 ms | 3606 ms | 3.76 |

## Causes and changes

1. Fire entry/exit select palettes 6/5; each clear rebuilds all 185 native
   tiles (1.75M T) although the firing view draws no tiles. Use the existing
   temporary-screen guard, as unit information already does.
2. The plotter recomputes ink/paper through palette maps per pixel and uses
   loops and hidden-VID0 helpers. Replace it with a U0 routine using the
   `B239H` delta/paper table and logical masks, keeping the original
   coordinate, mode, and `5DA5H` collision contracts.
3. `616EH` (single tiles; scroll redraws `6181H`, `646CH`, `64B0H`; cursor
   restore) converts raw glyphs. Route it through the existing descriptor
   lookup so `E79FH` uses the precolored cache and other tables keep the
   raw fallback.
4. Clear: fill VID0 with `PUSH` while interrupts are disabled and rebuild the
   `B239H` table only when the palette changes.
5. Raw glyph conversion: faster per-byte conversion through a nibble table.
   The planned one-entry memo of the last glyph/attribute/palette was dropped
   because the writers of the `E8DFH` glyph data are unaudited.
6. Text: inline the double-height and normal renderers' colorization.
7. Run the per-tile lookup and the tile copier from U0, not VID0.

Progress: [laser-squad-draw-speed-progress.md](laser-squad-draw-speed-progress.md).

## Validation

- Re-run the timing probe after each change.
- Compare full VID0 output of each routine against the previous build for
  the same snapshot state (pixel identity).
- `verify.py` after build changes; manual play of scroll, cursor, firing,
  unit information, and text screens.
