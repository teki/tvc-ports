# Laser Squad Source Acquisition

The original game is not committed. `prepare.py` downloads the documented
World of Spectrum archive when the local cache is absent, verifies the archive,
extracts only the named TAP member, and verifies that member before use.

| Local ignored file | Role |
| --- | --- |
| `LaserSquad.tap.zip` | Verified download cache |
| `LASERSQD.TAP` | Verified `LASERSQD.TAP` archive member used by the build |

Source URL:
<https://www.worldofspectrum.org//pub/sinclair/games/l/LaserSquad.tap.zip>

The archive URL, member name, archive hash, TAP hash, and expected generated
TOML hash are recorded in [port.toml](../port.toml). The generated description
is written to ignored `build/prepared/LASERSQD.TAP.toml`.

See [SHA256SUMS](SHA256SUMS) for the identities of the two cached files.
