# Laser Squad Drawing Optimization

## Scope

Speed up the main-game Spectrum-shadow to TVC GRAPHICS 4 conversion without
changing the original drawing producers, shadow-screen authority, palette
profiles, inverse attributes, or mapped-color collision behavior.

## Current Cost

Each eight-pixel Spectrum bitmap row currently makes two calls through the
generic nibble encoder. Each nibble then makes two more calls through a
branching palette-slot encoder. A single character-cell redraw repeats that
call chain for all eight raster rows.

## Implementation

1. Measure a representative `TVC_REDRAW_SHADOW_CELL` call from the supplied
   firing snapshot.
2. Keep the existing profile/attribute selection and compute its ink/paper
   packing prefix once per character cell.
3. Precompute every ink/paper/nibble GRAPHICS 4 output byte in one page-aligned
   256-byte table.
4. Replace the nested per-row calls with two indexed table reads while keeping
   the original Spectrum bitmap and attribute shadows authoritative.
5. Retain the existing API and mapper restoration so all current translated
   renderers continue to use the optimized path.

## Validation

- Compare representative cell-redraw cycle counts before and after.
- Recheck inverse paper, palette collisions, placement colors, gameplay
  colors, and the firing crosshair.
- Run the clean Laser Squad verifier and update expected generated hashes.
