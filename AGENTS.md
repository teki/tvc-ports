# AGENTS.md — TVC Ports

This repository contains game ports and software-oriented porting knowledge.
The sibling `rtvc` repository contains the emulator, command-line tools, and
authoritative hardware/emulator documentation.

## Documentation Ownership

- Put hardware ports, timing, interrupts, memory mapping, and video behavior in
  the appropriate current `rtvc/info/` machine reference.
- Put emulator behavior, debugger commands, and media/tool formats in
  `rtvc/info/rtvc.md` or the relevant `rtvc` tool documentation.
- Put ROM routines, firmware and OS interfaces, loaders, calling conventions,
  reusable translation patterns, and annotated software disassemblies in
  [knowledge/](knowledge/README.md).
- Put one game's addresses, experiments, patches, decisions, and limitations
  in that port's `notes.md`.
- A short hardware summary is acceptable when it explains a porting technique,
  but link to `rtvc` rather than reproducing its full hardware reference.

## Porting Rules

1. A port preserves the original program; it is not a reimplementation.
2. Preserve original control flow, algorithms, data, graphics, fonts, scripts,
   and structure wherever practical.
3. Translate hardware-specific routines narrowly. Ask before intentionally
   approximating, redesigning, or replacing behavior.
4. Identify original media by URL, archive member, and SHA-256. Download it
   during preparation when an authoritative archive provides it; do not commit
   commercial media unless redistribution is explicitly permitted.
5. Keep authored sources, patches, manifests, checksums, and regeneration
   instructions tracked. Keep derived objects, CAS/DSK images, local snapshots,
   and build trees ignored by default.
6. Record reusable verified findings in the knowledge base. Keep speculative
   or game-specific findings in the port until they can be promoted.
7. Port scripts must call the compatible `rtvc` binaries located by the shared
   helper. Do not import private modules from the `rtvc` source tree.

## Agent Entry Points

- Read [.agents/skills/port-game/SKILL.md](.agents/skills/port-game/SKILL.md)
  before working on a port.
- Read [knowledge/README.md](knowledge/README.md), then only the relevant
  platform and tooling documents.
- Read the port's `AGENTS.md`, `README.md`, `notes.md`, active plan, and
  validation record before changing it.

## Plans and Progress

Keep all detailed plans in [.agents/plans/](.agents/plans/README.md), with the
port name in the filename where applicable. When implementation begins, create
a sibling `<plan-name>-progress.md` containing completed work, current state,
validation already run, and the next concrete steps.

## Validation

Repository scripts require Python 3.11 or newer and use the standard-library
`tomllib`; do not add a local TOML parser or an older-Python fallback.

Each mature port should have three explicit operations:

- `prepare.py`: verify and extract original media;
- `build.py`: assemble the port into ignored `dist/`; and
- `verify.py`: perform a clean rebuild plus structural/payload smoke checks.

Run `verify.py` after changing extraction, patches, loaders, build scripts,
toolchain versions, or shared tools. Documentation-only changes do not require
it. Record slower or manual emulator scenarios in the port's `validation.md`.

## Git Policy

- Do not stage, commit, push, tag, or rewrite history without explicit user
  authorization.
- Preserve unrelated working-tree changes.
- Do not commit generated CAS or DSK files by default.
