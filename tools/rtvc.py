"""Locate rtvc commands and read TOML emitted by rtvc tools."""

from __future__ import annotations

import os
from pathlib import Path
import shutil
import subprocess
import tomllib


REPO_ROOT = Path(__file__).resolve().parents[1]


def find_tool(name: str) -> Path:
    """Find an rtvc command without coupling ports to an rtvc revision."""
    suffix = ".exe" if os.name == "nt" else ""
    filename = f"{name}{suffix}"
    candidates = []

    bin_dir = os.environ.get("RTVC_BIN_DIR")
    if bin_dir:
        candidates.append(Path(bin_dir).expanduser() / filename)

    rtvc_root = os.environ.get("RTVC_ROOT")
    if rtvc_root:
        root = Path(rtvc_root).expanduser()
        candidates.extend(
            [
                root / "target" / "debug" / filename,
                root / "target" / "release" / filename,
                root / "bin" / filename,
            ]
        )

    sibling = REPO_ROOT.parent / "rtvc"
    candidates.extend(
        [
            sibling / "target" / "debug" / filename,
            sibling / "target" / "release" / filename,
            sibling / "bin" / filename,
        ]
    )

    from_path = shutil.which(name)
    if from_path:
        candidates.append(Path(from_path))

    wrapper_dir = Path(__file__).resolve().parent
    for candidate in candidates:
        if candidate.is_file() and os.access(candidate, os.X_OK):
            resolved = candidate.resolve()
            if resolved.parent == wrapper_dir and resolved.name == filename:
                continue
            return resolved

    searched = "\n  ".join(str(path) for path in candidates)
    raise FileNotFoundError(
        f"cannot find {name}; set RTVC_BIN_DIR or RTVC_ROOT, install it on PATH, "
        f"or build the sibling rtvc checkout\n  {searched}"
    )


def run_tool(name: str, args, *, cwd=None, capture_output=False):
    command = [str(find_tool(name)), *(str(arg) for arg in args)]
    return subprocess.run(
        command,
        cwd=cwd,
        check=True,
        text=capture_output,
        capture_output=capture_output,
    )


def exec_tool(name: str, args, *, cwd=None):
    """Replace the wrapper process with the selected rtvc command."""
    command = [str(find_tool(name)), *(str(arg) for arg in args)]
    if cwd is not None:
        os.chdir(cwd)
    os.execv(command[0], command)


def find_runtime_root(tool: Path) -> Path:
    """Find the rtvc data root containing the ROM directory."""
    candidates = []

    rtvc_root = os.environ.get("RTVC_ROOT")
    if rtvc_root:
        candidates.append(Path(rtvc_root).expanduser())

    candidates.append(REPO_ROOT.parent / "rtvc")
    candidates.extend(tool.resolve().parents)

    for candidate in candidates:
        if (candidate / "roms").is_dir():
            return candidate.resolve()

    raise FileNotFoundError(
        f"cannot find the ROM directory for {tool}; set RTVC_ROOT to the "
        "compatible rtvc checkout"
    )


def _absolute_path(value: str, base: Path) -> str:
    path = Path(value).expanduser()
    if not path.is_absolute():
        path = base / path
    return str(path.resolve())


def absolute_cli_paths(args, *, path_options, value_options=()):
    """Preserve caller-relative paths when an emulator changes directory."""
    base = Path.cwd()
    path_options = set(path_options)
    value_options = set(value_options)
    result = []
    index = 0

    while index < len(args):
        argument = str(args[index])
        matching_option = next(
            (
                option
                for option in path_options
                if argument.startswith(f"{option}=")
            ),
            None,
        )
        if matching_option is not None:
            option, value = argument.split("=", 1)
            result.append(f"{option}={_absolute_path(value, base)}")
        elif argument in path_options and index + 1 < len(args):
            result.extend([argument, _absolute_path(str(args[index + 1]), base)])
            index += 1
        elif argument in value_options and index + 1 < len(args):
            result.extend([argument, str(args[index + 1])])
            index += 1
        elif argument.startswith("-"):
            result.append(argument)
        else:
            result.append(_absolute_path(argument, base))
        index += 1

    return result


def parse_rtvc_toml(path: Path):
    with path.open("rb") as source:
        return tomllib.load(source)


def read_single_segment(path: Path) -> bytes:
    document = parse_rtvc_toml(path)
    segments = document.get("segments", [])
    if len(segments) != 1:
        raise ValueError(f"{path} should contain exactly one segment")
    return bytes(segments[0]["bytes"])


def write_single_segment(path: Path, source: str, address: int, values: bytes):
    lines = [
        'format = "rtvc-asm-v1"',
        f'source = "{source}"',
        f"requested_origin = 0x{address:04X}",
        f"origin = 0x{address:04X}",
        f"next_addr = 0x{address + len(values):04X}",
        "",
        "[[segments]]",
        f"addr = 0x{address:04X}",
        "bytes = [",
    ]
    for start in range(0, len(values), 16):
        row = values[start : start + 16]
        lines.append("  " + ", ".join(f"0x{byte:02X}" for byte in row) + ",")
    lines.extend(["]", ""])
    path.write_text("\n".join(lines), encoding="ascii")
