# Laser Squad Unsplit Multi-load Progress

## Current State

Complete. Laser Squad now stores and loads one complete CAS per runtime
payload.

## Completed

- Confirmed direct VT-DOS block input into U3 with the reusable probe.
- Defined the one-call `B621H-FFFFH` runtime load path.
- Replaced the 16 transport chunks with `L64.CAS`, `L65.CAS`, `L66.CAS`, and
  `L68.CAS`.
- Updated the loader, build, structural verifier, and port documentation.

## Validation Run

- `python3 verify.py` passed under Python 3.14:
  - three patched CAS hashes;
  - four complete scenario payloads against their TAP blocks; and
  - seven exact DSK directory entries.
- Focused `rtvc` run called mode 1 with ID `64H`:
  - returned to the synthetic success breakpoint;
  - left mapper shadow `B0H`;
  - stored game success flag `00H`; and
  - matched all `49DFH` bytes at `B621H-FFFFH` with TAP block 6.

## Next Steps

- None for the unsplit transport change.
- The later repeated `68H` block-selection sequence remains separate work.
