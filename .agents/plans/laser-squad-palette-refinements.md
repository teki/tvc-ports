# Laser Squad palette refinements

## Approved scope

Apply the accepted comparison: deployment uses black/grey/cyan/yellow;
tactical blue floor grids map to the existing green slot; unit information
temporarily uses the existing black/green/yellow/red setup profile. Preserve
firing and hidden movement palettes, original bitmap data, and game logic.

## Integration

- Update deployment profile 3 hardware values and tactical profile 5 ink map.
- Hook the unit-information non-XOR clear at `875AH`, preserving attribute
  `46H`, and restore tactical colours at its `8875H` exit before map redraw.
- Share the temporary-screen clear machinery with hidden movement so neither
  interstitial needlessly recolours the resident map-glyph cache.
- Export the wrapper address through `build.py`, update verification baselines,
  and document the approved choices and focused regression evidence.

## Validation

Run the clean `verify.py` and rebuild the normal disk. Probe assembled phase
hooks in an isolated headless emulator, checking profiles, attributes,
preserved map cache, exit restoration, and deployment/floor ink-paper pairs.
Inspect unit-information rendering and return to the map where a suitable
snapshot is available. Keep generated evidence ignored.
