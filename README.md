# TVC Game Ports

This repository contains reproducible ports of games to the Videoton TV
Computer (TVC), together with the software-oriented knowledge gathered while
making them.

The sibling [`rtvc`](https://github.com/teki/rtvc) repository is the emulator
and toolchain. Its machine references describe hardware and emulator behavior.
This repository describes software behavior: ROM and operating-system
interfaces, loaders, calling conventions, game techniques, translation
patterns, and individual ports.

## Start Here

- [Knowledge base](knowledge/README.md)
- [Porting workflow](knowledge/porting.md)
- [Tooling workflow](knowledge/tooling.md)
- [Ports](ports/README.md)
- [Implementation plans](.agents/plans/README.md)
- [Agent instructions](AGENTS.md)
- [License](LICENSE)
- [Third-party material boundary](THIRD_PARTY.md)

Convenient wrappers for the emulator, assembler, disk utility, converters,
disassembler, and Zx82 are listed in [tools/](tools/README.md).

## Available Ports

| Port | Original platform | TVC output | Status |
| --- | --- | --- | --- |
| [Laser Squad](ports/laser-squad/README.md) | ZX Spectrum 48K | Multi-load 720 KiB DSK | Working |

Each port directory contains its build instructions, technical notes, source
patches, and validation procedure.

## Requirements

- Python 3.11 or newer; the scripts use the standard-library `tomllib`.
- Compatible `rtvc` command-line tools.

## Build and Run a Port

For Laser Squad, start in the repository root and run:

```sh
cd ports/laser-squad
python3 prepare.py
python3 build.py
../../tools/rtvc -d dist/lasersqd_tvc.dsk
```

`prepare.py` downloads the required original TAP into an ignored local cache
and verifies it by SHA-256. `build.py` creates
`dist/lasersqd_tvc.dsk`, and the final command starts that disk in `rtvc`.
The original media and generated DSK remain local and are not committed.

After changing port sources or build tooling, run the clean smoke check:

```sh
python3 verify.py
```

This rebuilds the port in a temporary directory and checks the generated CAS
payloads and DSK directory. See the
[Laser Squad README](ports/laser-squad/README.md) for port-specific details.

## Local Layout

The convenient development layout is:

```text
dev/
├── rtvc/
└── tvc-ports/
```

Scripts locate compatible `rtvc` commands through `RTVC_BIN_DIR`,
`RTVC_ROOT`, a sibling checkout, or `PATH`; they do not depend on a particular
home directory or pinned emulator revision. When `rtvc` intentionally breaks a
tool interface, the affected ports are updated with it.

Generated `build/` and `dist/` trees are not committed. Original commercial
media is acquired from documented external sources and verified by hash rather
than committed. Each port provides its own preparation, build, and verification
commands.

## Distribution Boundary

This repository does not publish generated game images. Original media is
downloaded into an ignored cache for local preparation. Game-derived
disassemblies are retained as reverse-engineering references but are excluded
from any license applied to original repository code and documentation; see
[THIRD_PARTY.md](THIRD_PARTY.md).

## License

Original material authored for this repository is licensed under the
[MIT License](LICENSE). Third-party and game-derived material is excluded; see
[THIRD_PARTY.md](THIRD_PARTY.md) for the boundary.
