#!/usr/bin/env python3
"""Acquire verified Laser Squad source media and generate its TAP description."""

from __future__ import annotations

import argparse
from pathlib import Path
import sys
import tomllib


PORT_ROOT = Path(__file__).resolve().parent
REPO_ROOT = PORT_ROOT.parents[1]
sys.path.insert(0, str(REPO_ROOT / "tools"))

from media import ensure_zip_member, sha256_file
from rtvc import run_tool


DEFAULT_BUILD_DIR = PORT_ROOT / "build"


def source_config():
    with (PORT_ROOT / "port.toml").open("rb") as source:
        return tomllib.load(source)["source_tap"]


def acquire_source() -> Path:
    config = source_config()
    return ensure_zip_member(
        url=config["url"],
        archive_path=PORT_ROOT / config["archive_path"],
        archive_sha256=config["archive_sha256"],
        member_name=config["archive_member"],
        output_path=PORT_ROOT / config["path"],
        output_sha256=config["sha256"],
    )


def prepare(build_dir: Path):
    config = source_config()
    source_tap = acquire_source()
    prepared_dir = build_dir / "prepared"
    prepared_dir.mkdir(parents=True, exist_ok=True)
    generated = prepared_dir / "LASERSQD.TAP.toml"
    run_tool(
        "rtvc-tap2toml",
        [source_tap, "-o", generated],
        cwd=PORT_ROOT,
    )
    actual = sha256_file(generated)
    expected = config["generated_toml_sha256"]
    if actual != expected:
        raise ValueError(
            "generated LASERSQD.TAP.toml SHA-256 mismatch: "
            f"expected {expected}, found {actual}"
        )
    print(f"prepared: {generated}")
    return generated


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build-dir", type=Path, default=DEFAULT_BUILD_DIR)
    arguments = parser.parse_args()
    prepare(arguments.build_dir.resolve())
