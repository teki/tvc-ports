# Ports

Each game will have one directory under `ports/`. A port starts with only the
files it needs; there is no template.

A mature port normally contains:

```text
ports/<name>/
├── README.md
├── AGENTS.md
├── port.toml
├── prepare.py
├── build.py
├── verify.py
├── notes.md
├── validation.md
├── sources/
├── src/
├── disassembly/
└── experiments/
```

Generated `build/` and `dist/` directories are ignored. Original media is
identified by source URL, archive member, and SHA-256. Preparation may download
it into an ignored cache, but it remains uncommitted unless redistribution has
been explicitly approved.

- [Laser Squad](laser-squad/README.md) — ZX Spectrum 48K to TVC, multi-load DSK

The original Laser Squad files remain in `rtvc` until this standalone copy has
been reviewed and the old repository is cleaned separately.
