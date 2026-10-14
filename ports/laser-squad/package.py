#!/usr/bin/env python3
"""Build a release zip of the Laser Squad TVC port, named by commit hash.

Refuses to run unless the whole repository is committed (no modified,
staged or untracked-but-not-ignored files), so the hash in the zip name
identifies exactly the sources the contents were built from.

The zip holds the DSK image, the HTML manuals and a BUILD.txt recording the
commit. It is written to dist/release/laser-squad-<hash>.zip.
"""

import argparse
import pathlib
import subprocess
import sys
import tempfile
import time
import zipfile

PORT_ROOT = pathlib.Path(__file__).resolve().parent
REPO_ROOT = PORT_ROOT.parents[1]
DSK_NAME = "lasersqd_tvc.dsk"


def git(*args):
    result = subprocess.run(
        ["git", "-C", str(REPO_ROOT), *args],
        check=True, capture_output=True, text=True,
    )
    return result.stdout.strip()


def run(script, *args):
    subprocess.run([sys.executable, str(PORT_ROOT / script), *args],
                   cwd=PORT_ROOT, check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out-dir", type=pathlib.Path,
                        default=PORT_ROOT / "dist" / "release")
    arguments = parser.parse_args()

    dirty = git("status", "--porcelain")
    if dirty:
        sys.exit("Refusing to package: the working tree has uncommitted "
                 "changes. Commit them first.\n" + dirty)

    commit = git("rev-parse", "HEAD")
    short = git("rev-parse", "--short=10", "HEAD")
    subject = git("log", "-1", "--format=%s")
    commit_time = int(git("log", "-1", "--format=%ct"))
    commit_date = time.strftime("%Y-%m-%d", time.gmtime(commit_time))
    name = "laser-squad-%s" % short

    run("prepare.py")
    with tempfile.TemporaryDirectory() as tmp:
        tmp = pathlib.Path(tmp)
        run("build.py", "--dist-dir", str(tmp))
        manuals = []
        for md in sorted((PORT_ROOT / "manual").glob("LaserSquad*.md")):
            html = tmp / (md.name[:-3] + ".html")
            run("md2html.py", str(md), str(html))
            manuals.append(html)
        dsk = tmp / DSK_NAME
        if not dsk.is_file():
            sys.exit("build did not produce %s" % DSK_NAME)

        info = (
            "Laser Squad - TVC disk conversion\n"
            "Commit:  %s\n"
            "Date:    %s\n"
            "Subject: %s\n"
            "\n"
            "Requires a Videoton TV Computer with a floppy disk drive.\n"
            "Insert the disk and type: LOAD \"*\"\n"
        ) % (commit, commit_date, subject)

        arguments.out_dir.mkdir(parents=True, exist_ok=True)
        target = arguments.out_dir / (name + ".zip")
        stamp = time.gmtime(commit_time)[:6]
        members = [(dsk, DSK_NAME)] + [(m, m.name) for m in manuals]
        with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as archive:
            for source, arcname in members:
                entry = zipfile.ZipInfo("%s/%s" % (name, arcname), stamp)
                entry.compress_type = zipfile.ZIP_DEFLATED
                entry.external_attr = 0o644 << 16
                archive.writestr(entry, source.read_bytes())
            entry = zipfile.ZipInfo("%s/BUILD.txt" % name, stamp)
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.external_attr = 0o644 << 16
            archive.writestr(entry, info)

    print("wrote %s" % target)


if __name__ == "__main__":
    main()
