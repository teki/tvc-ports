# Laser Squad TVC beeper audio progress

## Current state

Implemented as a plain translation. User confirmed that audio works in
interactive `rtvc` play.

## Completed

- Inventoried all speaker writes; the three sound routines are in `LSCODE`.
- First stage clears port `05H` bit 4 and its `0B12H` mirror.
- `B5BEH` effect player: `B5BDH` holds TVC levels `81H`/`BDH`, same T-states.
- `8F2CH` chirp and `94E0H` explosion translated; shared `TVC_RANDOM_BEEP` at
  the unreferenced `B614H-B620H` gap.
- `verify.py`: new CAS hashes, sound-byte checks, and an untranslated
  `OUT (FEH)` scan.
- Port notes, validation record, and knowledge base updated.

## Validation run

- `verify.py` passed.
- Differential headless probe (ignored `build/sound_probe.py`): all 13 effects
  identical in levels, timing, and state; chirp state identical with the
  expected +3/+36-38/+18 T changes; random helper consistent with `R`.
- Real-disk boot: `0B12H` stays `0FH` through `LS2` and the scenario 1 load.
- Keyboard-driven firing-snapshot run: effects 11 and 5 played with only
  `81H`/`BDH` levels. Firing a projectile was not reached automatically.

- User-confirmed interactive listening in `rtvc`.

## Next steps

- Optionally save a snapshot just before a shot for an automated chirp and
  explosion regression.
