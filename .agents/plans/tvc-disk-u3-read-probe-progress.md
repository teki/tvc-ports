# TVC Direct U3 Disk-read Probe Progress

## Current State

Complete. The probe verifies that the tested TVC 1.2 ROM/VT-DOS block-input
path can write directly to U3 at `C000H`.

## Completed

- Defined a self-contained reopen, guard, direct-read, and compare experiment.
- Chose `C000H` as the safe ROM-overlaid U3 destination.
- Simplified the input to the probe's own normal `U3PROBE.CAS`.
- Added fixed-address result, status, mapper, mismatch, phase, and close fields.
- Recorded the verified behavior in `knowledge/tvc.md` and corrected the
  historical Laser Squad assumption.

## Validation Run

- Assembled `knowledge/tvc-disk-u3-read-probe.asm` as a 630-byte CAS.
- Placed it on a new 720 KiB DSK as `U3PROBE.CAS`.
- Ran from the clean TVC 1.2 VT-DOS boot snapshot in `rtvc`.
- Observed result record at `3000H`: `01 00 B0 FF 03 00`.
- Compared raw U3 `C000H-C01FH` with U0 `1A30H-1A4FH`; all 32 bytes matched.

## Next Steps

- None for the probe.
- The follow-up Laser Squad unsplit multi-load plan is complete.
