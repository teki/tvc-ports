# Third-party and game-derived material

This repository combines original porting tools and documentation with
material derived from software owned by other copyright holders.

Original material authored for this repository is available under the
[MIT License](LICENSE). The following are expressly outside that license:

- game code, data, recovered source, and disassemblies under
  `ports/laser-squad/`;
- generated CAS or DSK images and other artifacts containing game content; and
- `knowledge/48.rom.asm`, whose provenance is recorded in
  `knowledge/48.rom.asm.md` but whose upstream license has not been established.

The original Laser Squad TAP and its generated TOML description are not
committed. `prepare.py` downloads the named World of Spectrum archive into an
ignored local cache and verifies the archive, selected TAP member, and
generated description by SHA-256.

External availability, archival hosting, or inclusion of derived research
material here does not grant redistribution or relicensing rights. Consult the
relevant copyright holders and source archives before redistributing
third-party material or generated game images.
