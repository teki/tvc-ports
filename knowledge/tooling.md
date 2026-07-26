# Porting Tooling

The `rtvc` repository supplies the emulator and media tools. Ports follow the
current compatible tool interfaces rather than pinning an emulator revision.

Repository scripts require Python 3.11 or newer. Read TOML with the
standard-library `tomllib`.

The flat `tools/media.py` module holds proven format-level operations shared by
ports: verified ZIP-member acquisition, TAP block parsing, TVC CAS
creation/parsing, and SHA-256 calculation. Game-specific block selection,
patches, transport splitting, and disk layout remain in each port.

## Locate the Toolchain

The shared `tools/rtvc.py` helper searches, in order:

1. `RTVC_BIN_DIR`;
2. `RTVC_ROOT/target/debug`, `target/release`, or `bin`;
3. a sibling `../rtvc` checkout; and
4. `PATH`.

There is no revision lock. If an intentional `rtvc` interface change breaks a
port, update the shared helper or affected port in the same development cycle.

Executable wrappers with the command names are provided in `tools/`. From the
repository root, use commands such as:

```sh
tools/rtvc ports/laser-squad/dist/lasersqd_tvc.dsk
tools/rtvc-asm --origin 8000H source.asm -o output.toml
tools/rtvc-dsk dir ports/laser-squad/dist/lasersqd_tvc.dsk
tools/rtvc-tap2toml tape.tap -o tape.toml
tools/rtvc-disasm --origin 8000H program.bin -o program.asm
tools/rtvc-cas2wav program.cas program.wav
tools/zx82 snapshot.z80
```

The wrappers replace themselves with the located binary, so interactive
emulator behavior and exit status are preserved. `rtvc` and `zx82` also find
the selected toolchain's companion `roms/` directory and launch from its
parent. Before changing directory, they make media, snapshot, ROM, and
screenshot arguments absolute. Caller-relative paths therefore continue to
work from any port directory.

## Stable Tool Boundary

Port scripts may invoke supported binaries such as:

- `rtvc`;
- `rtvc-asm`;
- `rtvc-dsk`;
- `rtvc-tap2toml`; and
- `rtvc-disasm`.

Do not import private Python or Rust implementation helpers from the `rtvc`
source tree. If a port needs machine-readable behavior that no stable command
provides, add a supported interface to `rtvc` or implement a small,
format-specific helper in this repository.

## Debugging and Automation

Use the current
[`rtvc` debugger documentation](https://github.com/teki/rtvc/blob/HEAD/info/rtvc.md#debugger)
for current commands.

Useful port workflows include:

- mapped-memory reads and writes;
- breakpoints and instruction stepping;
- bounded instruction traces;
- deterministic `key_press` commands measured in 50 Hz frames;
- screenshots for source/target comparison; and
- saved snapshots at meaningful stage boundaries.

Snapshots made during diagnosis remain local unless they become deliberate,
stable regression fixtures.

### Corruption Investigation Pattern

For a failure triggered by a known input or frame boundary:

1. save a snapshot immediately before the trigger;
2. reproduce input with `key_press <keycode> <duration_frames>`;
3. start a bounded instruction trace before the input is consumed;
4. identify the first invalid coordinate, pointer, mapper value, or write;
5. trace that value backward to the state that produced it; and
6. compare mapper restoration and actual interrupt stack depth independently.

Later writes may damage code or mapping state and disguise the initiating
fault. In Laser Squad, screen garbage suggested bad paging, but the mapper was
restored correctly; a deeper TVC firmware interrupt stack had already
overwritten the coordinate data that drove the later writes.

See the
[Laser Squad diagnostic checkpoints](../ports/laser-squad/notes.md#diagnostic-checkpoints)
for the snapshot/trace workflow and the
[interrupt-stack diagnosis](../ports/laser-squad/notes.md#tvc-interrupt-stack-isolation)
for the first bad value, false mapper lead, and verified correction.

## Per-port Commands

A mature port should keep its orchestration at the port root:

```text
prepare.py   verify and extract exact source media
build.py     assemble tracked sources into ignored dist/
verify.py    clean rebuild plus structural and payload smoke tests
```

Keep the default verification unattended and quick. Put slower emulator
automation behind an explicit option, or record a concise manual scenario in
`validation.md`.
