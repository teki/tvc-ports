# AGENTS.md — Laser Squad

Read the repository [port-game skill](../../.agents/skills/port-game/SKILL.md),
[Spectrum notes](../../knowledge/zx-spectrum.md), and
[TVC software notes](../../knowledge/tvc.md) before changing the port.

## Invariants

- This is a translation of the original Spectrum program, not a
  reimplementation.
- The verified World of Spectrum `LASERSQD.TAP` member is the build authority
  for original load blocks; `prepare.py` downloads it into the ignored source
  cache when absent.
- Keep original game logic and data intact; isolate TVC hardware translations
  in the tracked assembly overlays and loader support.
- Preserve the disk file names and multi-load stage-selection behavior.
- Do not commit `build/`, `dist/`, or diagnostic snapshots.

## Entry Points

- `prepare.py`: acquires and verifies the source TAP, then generates its
  ignored TOML description.
- `build.py`: creates `dist/lasersqd_tvc.dsk`.
- `verify.py`: performs a clean build and validates every CAS hash and DSK
  directory entry.
- `notes.md`: port map, findings, decisions, and historical progress.
- `validation.md`: automated and manual smoke checks.

After changing sources, patches, loaders, media handling, or shared tools, run:

```sh
python3 verify.py
```
