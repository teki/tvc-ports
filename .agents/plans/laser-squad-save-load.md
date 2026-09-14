# Laser Squad disk save/load

## Scope

Translate the original B15CH tape boundary for menu save and saved-game load
to one VT-DOS disk file, `SAVE.CAS`. Preserve the original 49DFH-byte transfer
at B621H and the existing scenario selection path. Leave tape verify mode for
a later pass.

## Integration

- Keep the original menu calls and B15BH success flag contract.
- Place disk I/O in the loader's resident U0 code, which remains callable while
  ROM and DOS change higher page mappings.
- Write a TVC application header followed by the unchanged game payload.
- On saved-game load, rebuild the native large-glyph cache from the restored
  Spectrum source data and current palette.
- Keep the generated game DSK writable at runtime; builds regenerate it.

## Validation

Run `verify.py`, check the overlay target and header bytes, then exercise save
and load from the menu snapshot against a writable DSK. Compare the saved file
payload byte-for-byte with the pre-save game region and inspect the load result.
