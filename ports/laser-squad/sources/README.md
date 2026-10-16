# Laser Squad Source Acquisition

The original game is not committed. `prepare.py` downloads the documented
World of Spectrum archive when the local cache is absent, verifies the archive,
extracts only the named TAP member, and verifies that member before use.

| Local ignored file | Role |
| --- | --- |
| `LaserSquad.tap.zip` | Verified download cache |
| `LASERSQD.TAP` | Verified `LASERSQD.TAP` archive member used by the build |
| `Laser_Squad__ENGLISH.zip` | Verified CPC download cache |
| `Laser_Squad__ENGLISH__Side_A.cdt` | CPC Side A member; tiles and palettes for scenarios 1 and 2 |
| `Laser_Squad__ENGLISH__Side_B.cdt` | CPC Side B member; tiles and palettes for scenario 3 and the expansion |

Source URL:
<https://www.worldofspectrum.org//pub/sinclair/games/l/LaserSquad.tap.zip>

The archive URL, member name, archive hash, TAP hash, and expected generated
TOML hash are recorded in [port.toml](../port.toml). The generated description
is written to ignored `build/prepared/LASERSQD.TAP.toml`.

CPC source: the download link <https://cpcrulez.fr/f/p9d> on
<https://cpcrulez.fr/GamesTest/laser_squad.htm>. `prepare.py` downloads,
verifies, and extracts both tape sides the same way as the TAP.

See [SHA256SUMS](SHA256SUMS) for the identities of the cached files.
