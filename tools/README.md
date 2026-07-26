# Shared Tools

Keep this directory flat. Add only helpers that have proved reusable across
ports; leave game-specific orchestration in the port itself.

- `rtvc.py` locates compatible `rtvc` commands and reads the documented TOML
  emitted by the tools using Python 3.11+'s standard-library `tomllib`.
- `media.py` provides verified ZIP-member acquisition, TAP block parsing, TVC
  CAS creation/parsing, and file hashing for port scripts.
- `rtvc`, `rtvc-asm`, `rtvc-dsk`, `rtvc-tap2toml`, `rtvc-disasm`,
  `rtvc-cas2wav`, and `zx82` are executable wrappers around the corresponding
  compatible commands.

Run them directly from the repository root:

```sh
tools/rtvc ports/laser-squad/dist/lasersqd_tvc.dsk
tools/rtvc-asm --help
tools/rtvc-dsk dir ports/laser-squad/dist/lasersqd_tvc.dsk
tools/rtvc-tap2toml --help
tools/rtvc-disasm --help
tools/rtvc-cas2wav --help
tools/zx82 /path/to/reference.z80
```

The emulator wrappers locate the companion `roms/` directory and launch from
its parent, as required by the current emulators. Media, snapshot, ROM, and
screenshot paths are made absolute first, so paths remain relative to the
directory where the wrapper was invoked. For example, this works from
`ports/laser-squad`:

```sh
../../tools/rtvc -d dist/lasersqd_tvc.dsk
```

Other wrappers forward arguments unchanged. Command discovery uses
`RTVC_BIN_DIR`, `RTVC_ROOT`, a sibling `../rtvc` checkout, then `PATH`.
