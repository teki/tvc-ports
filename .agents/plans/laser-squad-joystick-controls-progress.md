# Laser Squad TVC joystick control selection progress

## Current state

Implemented. Options 1-3 assemble to one TVC joystick reader; option 4 stays
keyboard.

## Completed

- Identified the four control methods and their shared action byte.
- Confirmed numeric menus use `KEY-SCAN`, not the Sinclair reader at `B0E8H`.
- Replaced Sinclair, Kempston, and cursor readers with `TVC_JOYSTICK` on
  keyboard row 8.
- Removed the unused number-key Sinclair compatibility reader.

## Validation run

- `/opt/homebrew/bin/python3.14 verify.py` passed patched-CAS hashes, the three
  joystick overlay jumps, keyboard jump, four scenario payloads, four native
  graphics payloads, and 11 DSK entries.
- Isolated headless probe on `boot12dos.rtvcsnap.zip` confirmed none/fire/up/
  down/right/left action bits from `B0E8H`, `B0FDH`, and `B117H`.

## Next steps

- Interactive play with TVC joystick / host arrows and Tab.
