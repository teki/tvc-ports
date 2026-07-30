# Laser Squad

This is the ZX Spectrum 48K to TVC port of Laser Squad.

The port is disk-based. It builds an autorun `LOADER.CAS`, two initial program
files, and one file for each later multi-load payload into a 720 KiB TVC DSK
image.

## Build

Use Python 3.11 or newer. Build compatible `rtvc` command-line tools, or set
`RTVC_BIN_DIR` or `RTVC_ROOT`. With sibling `rtvc` and `tvc-ports` checkouts,
run:

```sh
python3 prepare.py
python3 build.py
```

The first preparation downloads the exact Laser Squad TAP archive from World
of Spectrum and verifies both the ZIP and selected TAP member. Later builds use
the ignored local cache.

The final image is written to:

```text
dist/lasersqd_tvc.dsk
```

Launch it from this directory with:

```sh
../../tools/rtvc -d dist/lasersqd_tvc.dsk
```

Run the clean post-change smoke checks with:

```sh
python3 verify.py
```

Generated `build/` and `dist/` files are ignored.

## Port Documentation

- [Current technical notes and history](notes.md)
- [Validation scenarios](validation.md)
- [Original and reference media](sources/README.md)
- [Recovered disassembly](disassembly/README.md)
- [Port-specific agent instructions](AGENTS.md)

The earlier files remain in `rtvc/data/porting` until this copy has been
reviewed and the old repository is cleaned separately.
