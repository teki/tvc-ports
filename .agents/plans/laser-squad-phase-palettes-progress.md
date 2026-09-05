# Laser Squad Phase-specific TVC Palettes Progress

## Current State

Implemented. The three profiles and their phase transitions assemble into the
normal reproducible disk build.

## Completed

- Confirmed `B1F7H` constructs the hidden-movement screen.
- Confirmed `8495H` enters the firing display and `85C3H` is its exit redraw.
- Chosen three additional four-color profiles and deliberate eight-ink maps.
- Added narrow movement, tactical-restore, firing-entry, and firing-exit hooks.
- Kept the text-only movement screen from rebuilding the 185-glyph tactical
  table; the retained table is rebuilt only if the tactical restore needs it.
- Updated the pinned patched-CAS hashes, support size, notes, and manual checks.
- Added direct clean-build assertions for all seven hardware palettes and
  their complete Spectrum-ink fallback maps.
- Restored yellow rather than dim white in the tactical profile after visual
  feedback; firing retains dim white to preserve yellow-marker contrast.

## Validation Run

- `/opt/homebrew/bin/python3.14 build.py` completed and generated the 11-file
  DSK.
- `/opt/homebrew/bin/python3.14 verify.py` passed all patched-CAS hashes, four
  source scenario payloads, four native graphics payloads, and 11 DSK entries.

## Next Steps

- Perform focused interactive inspection of movement, tactical, and firing
  screens.
