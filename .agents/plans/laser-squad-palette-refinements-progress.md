# Laser Squad palette refinements progress

## Current state

Implemented. Deployment, tactical floor, and unit-information palette changes
assemble into the normal reproducible disk build.

## Completed

- Compared all ten supplied Spectrum SCR files with the current assembly maps.
- Located unit-information entry clear `875AH` (attribute `46H`) and exit
  clear `8875H`, followed by the original tactical-map redraw.
- Identified the existing temporary movement clear as a reusable way to avoid
  two unnecessary map-glyph cache recolourings around unit information.
- Changed profile 3 hardware to black/grey/cyan/yellow; mapped tactical blue
  floors onto the existing green slot.
- Shared the temporary-screen clear helper with unit information, hooked
  `875AH`/`8875H`, and reused the firing-exit restoration.
- Exported the wrappers through `build.py`, updated hashes and palette
  baselines, and recorded the approved choices.

## Validation run

- `/opt/homebrew/bin/python3.14 verify.py` passed patched-CAS hashes, unit-
  information overlay hooks, four source scenario payloads, four native
  graphics payloads, and 11 DSK entries.
- Isolated headless probe on `boot12dos.rtvcsnap.zip` confirmed profiles,
  preserved `46H`, intact map-glyph sentinel, exit restoration, and the
  deployment/floor ink-paper pairs.

## Next steps

- Interactive inspection of unit information and return to the map.
