# Laser Squad SkoolKit disassembly

This directory contains a machine-generated starting point for disassembling
the verified `LASERSQD.TAP` described in
[`sources/README.md`](../sources/README.md) with
[SkoolKit 10.0](https://skoolkit.ca/). It is not yet a hand-annotated or
execution-map-guided disassembly.

## Files

- `tape-info.txt` lists all 13 TAP blocks.
- `lasersqd.z80` is the pristine 48K snapshot used for the
  canonical disassembly. Tape blocks 4 (`LS` at `$7530`) and 6 (`LSCODE` at
  `$5E28`) are loaded directly, and execution is set to start at `$5E28`.
- [`lasersqd.ctl`](lasersqd.ctl) is the editable SkoolKit control file for the
  `LSCODE` range `$5E28-$B620`.
- [`lasersqd.skool`](lasersqd.skool) is the canonical SkoolKit disassembly.
- [`lasersqd.asm`](lasersqd.asm) is the generated, labelled hexadecimal Z80
  assembly.
- `snapshot-info.txt` records the canonical snapshot state.
- `lasersqd-loader-wait.*` records a second pass made by simulating the BASIC
  loader. It stops in the Spectrum ROM tape routine (`PC=$0293`) while waiting
  for the first custom multiload block. This is useful for loader investigation,
  but it is not the canonical disassembly. Its snapshot and three generated
  outputs are reproducible and covered by `SHA256SUMS`.
- [`SHA256SUMS`](SHA256SUMS) contains checksums for the source tape and canonical
  outputs.

SkoolKit's generated comments describe individual instructions mechanically;
they should be reviewed and replaced with domain-level annotations as the game
is understood. The static analyser also emits unresolved-label warnings where
code refers to data or entry points that it did not classify as routines.

## Rebuild

SkoolKit 10.0 requires Python 3.11 or newer here, matching the repository
baseline. The local `.venv` is intentionally ignored by Git. `rebuild.py`
acquires the verified TAP when it is absent and recreates both disassembly
passes:

```bash
cd ports/laser-squad/disassembly
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python rebuild.py
```

The equivalent canonical commands are:

```bash

.venv/bin/tapinfo.py ../sources/LASERSQD.TAP > tape-info.txt
.venv/bin/tap2sna.py \
  --ram load=4,30000 \
  --ram load=6,24104 \
  --start 24104 \
  --stack 24100 \
  ../sources/LASERSQD.TAP lasersqd.z80

.venv/bin/sna2ctl.py \
  --comments --handle-rst --hex \
  --start 0x5E28 --end 0xB621 \
  lasersqd.z80 > lasersqd.ctl
.venv/bin/sna2skool.py \
  --comments --handle-rst --hex \
  -c lasersqd.ctl lasersqd.z80 > lasersqd.skool
.venv/bin/skool2asm.py \
  --create-labels --hex \
  lasersqd.skool > lasersqd.asm
.venv/bin/snapinfo.py lasersqd.z80 > snapshot-info.txt
shasum -a 256 \
  ../sources/LASERSQD.TAP lasersqd.z80 lasersqd.ctl lasersqd.skool lasersqd.asm \
  > SHA256SUMS
```

The loader-wait pass begins with a normal simulated Spectrum load:

```bash
.venv/bin/tap2sna.py \
  ../sources/LASERSQD.TAP lasersqd-loader-wait.z80
```

It then uses the same `sna2ctl.py`, `sna2skool.py`, and `skool2asm.py`
options without limiting the address range. See `rebuild.py` for the exact
commands. SkoolKit reports a simulation timeout at `PC=$0293`; that is the
expected waiting state, not a failed build.

The seven blocks after `LSCODE` use nonstandard flags (`$64-$68`) and are game
multiload payloads. They are listed in `tape-info.txt` but are not folded into
the canonical snapshot; their destinations and overlays need to be recovered
from the runtime loader before they can be disassembled accurately.
