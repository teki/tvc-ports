#!/usr/bin/env python3
"""Experiment: emulated cycle cost of Laser Squad drawing paths.

Starts a headless rtvc from the in-game firing snapshot and times the same
game routines twice: once with the pristine Spectrum LSCODE bytes and once
with the current TVC build (support image, hidden VID0 code, native font and
patched LSCODE). The Spectrum column is the original code executed on the TVC
CPU without video waits, i.e. a Spectrum T-state count without contention.

Run `python3 build.py` first; the probe reads the ignored build TOMLs.
"""

import argparse
import json
import pathlib
import select
import socket
import subprocess
import sys
import time
import tomllib

PORT_ROOT = pathlib.Path(__file__).resolve().parents[2]
REPO_ROOT = PORT_ROOT.parents[1]
BUILD = PORT_ROOT / "build"
sys.path.insert(0, str(REPO_ROOT / "tools"))

from media import read_tap_block_data  # noqa: E402

SNAPSHOT = REPO_ROOT / "lsql-fire.rtvcsnap.zip"
HARNESS = 0x3F00
HARNESS_END = HARNESS + 6
TVC_HZ = 3_125_000
ZX_HZ = 3_500_000


def toml(path):
    return tomllib.loads(path.read_text())


class Emulator:
    def __init__(self, port):
        self.process = subprocess.Popen(
            [str(REPO_ROOT / "tools" / "rtvc"), "--headless", "--port", str(port),
             str(SNAPSHOT)],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
        )
        for _ in range(100):
            try:
                self.socket = socket.create_connection(("127.0.0.1", port))
                break
            except OSError:
                time.sleep(0.1)
        else:
            raise RuntimeError("debugger did not start")
        self.buffer = b""
        self.events = []
        self.command(cmd="pause")

    def readline(self, timeout=None):
        while b"\n" not in self.buffer:
            ready, _, _ = select.select([self.socket], [], [], timeout)
            if not ready:
                return None
            chunk = self.socket.recv(1 << 20)
            if not chunk:
                raise RuntimeError("debugger closed the connection")
            self.buffer += chunk
        line, self.buffer = self.buffer.split(b"\n", 1)
        return json.loads(line)

    def command(self, **request):
        self.socket.sendall((json.dumps(request) + "\n").encode())
        while True:
            reply = self.readline(60)
            if reply is None:
                raise RuntimeError(f"{request.get('cmd')}: no reply")
            if "event" in reply:
                self.events.append(reply)
                continue
            if reply.get("status") != "ok":
                raise RuntimeError(f"{request.get('cmd')}: {reply}")
            return reply

    def wait_breakpoint(self, timeout=120):
        while True:
            if self.events:
                event = self.events.pop(0)
            else:
                event = self.readline(timeout)
                if event is None:
                    raise RuntimeError("breakpoint not reached")
            if event.get("event") == "breakpoint":
                return event["pc"]

    def write(self, addr, data):
        data = bytes(data)
        for offset in range(0, len(data), 4096):
            self.command(cmd="write_memory", addr=addr + offset,
                         data=list(data[offset:offset + 4096]))

    def read(self, addr, length, bank=None):
        request = dict(cmd="read_memory", addr=addr, len=length)
        if bank:
            request["bank"] = bank
        return bytes(self.command(**request)["data"])

    def map_game(self):
        self.command(cmd="write_port", port=0x02, value=0xB0)
        self.write(0x0003, [0xB0])

    def close(self):
        try:
            self.command(cmd="close_app")
        except Exception:
            pass
        self.process.wait(timeout=10)


def segments(path):
    for segment in toml(path).get("segments", []):
        yield segment["addr"], bytes(segment["bytes"])


class Build:
    def __init__(self, build_dir=BUILD):
        self.dir = build_dir
        document = toml(build_dir / "lasersqd_loader_bootstrap.toml")
        self.symbols = document["symbols"]
        base = self.symbols["TVC_SUPPORT_IMAGE"]
        self.support_base = base

    def run(self, name):
        """Runtime address of a support-image label or an explicit *_RUN symbol."""
        if name in self.symbols and name.endswith("_RUN"):
            return self.symbols[name]
        return 0x21BC + self.symbols[name] - self.support_base

    def install(self, emu, palette=5):
        emu.map_game()
        for name in ("lasersqd_tvc_font.toml", "lasersqd_tvc_support.toml",
                     "lasersqd_lscode_5e28_tvc.toml"):
            for addr, data in segments(self.dir / name):
                emu.write(addr, data)
        emu.command(cmd="write_port", port=0x0C, value=0x00)
        emu.command(cmd="write_port", port=0x02, value=0x90)
        for addr, data in segments(self.dir / "lasersqd_tvc_hidden_video.toml"):
            emu.write(addr, data)
        emu.map_game()
        # Install the snapshot scenario's pre-coloured Gxx tiles and lookups.
        graphics = (self.dir / "g64.cas").read_bytes()[144:]
        emu.write(0x2880, graphics[:0x1640])
        emu.write(0x4000, graphics[0x1640:])
        emu.write(self.run("TVC_PALETTES"), graphics[0x1640 + 0x1480:][:4])
        emu.write(self.run("TVC_PALETTE_ID_RUN"), [palette])
        return call(emu, self.run("TVC_APPLY_PALETTE_RUN"), palette)


def install_original(emu):
    emu.map_game()
    emu.write(0x5E28, read_tap_block_data(PORT_ROOT / "sources" / "LASERSQD.TAP", 5))


def call(emu, target, a=0, stop=None, state=()):
    """DI; LD A,a; CALL target; JR $. Return elapsed CPU cycles."""
    emu.map_game()
    for addr, data in state:
        emu.write(addr, data)
    emu.write(HARNESS, bytes((0xF3, 0x3E, a, 0xCD, target & 0xFF, target >> 8,
                              0x18, 0xFE)))
    emu.command(cmd="set_register", name="SP", value=0x3FFE)
    emu.command(cmd="set_register", name="PC", value=HARNESS)
    end = stop if stop is not None else HARNESS_END
    emu.command(cmd="breakpoint_add", addr=end)
    start = emu.command(cmd="status")["cycles"]
    emu.command(cmd="continue")
    pc = emu.wait_breakpoint()
    cycles = emu.command(cmd="status")["cycles"] - start
    emu.command(cmd="breakpoint_remove", addr=end)
    if pc != end:
        raise RuntimeError(f"stopped at {pc:04X}H, expected {end:04X}H")
    return cycles


TACTICAL = [(0xB716, [0x9F, 0xE7]), (0x5CFE, [0x01, 0x01]), (0x5D00, [0x45])]
SCENARIOS = [
    # name, target, A, stop, state
    ("clear 602CH", 0x602C, 0, None, []),
    ("map 612AH (121 tiles)", 0x612A, 0, None, TACTICAL),
    ("map 6181H (121 tiles)", 0x6181, 0, None, TACTICAL),
    ("tile 616EH (E79FH)", 0x616E, 0x10, None, TACTICAL),
    ("map 6181H (E65FH)", 0x6181, 0, None,
     [(0xB716, [0x5F, 0xE6]), (0x5CFE, [0x01, 0x01]), (0x5D00, [0x45])]),
    ("raw glyph 60AFH", 0x60AF, 0x05, None, TACTICAL),
    ("text 6072H black paper", 0x6072, ord("A"),
     None, [(0x5CFE, [0x02, 0x02]), (0x5D00, [0x47])]),
    ("text 6072H inverse 70H", 0x6072, ord("A"),
     None, [(0x5CFE, [0x02, 0x02]), (0x5D00, [0x70])]),
    ("double text 64F7H", 0x64F7, ord("A"),
     None, [(0x5CFE, [0x02, 0x02]), (0x5D00, [0x46, 0x46])]),
    ("plot 8444H set", 0x844C, 0, None,
     [(0x5DA3, [40, 40, 0, 0])]),
    ("plot 8444H clear", 0x844C, 0, None,
     [(0x5DA3, [40, 40, 0, 1])]),
    ("plot 8444H xor", 0x844C, 0, None,
     [(0x5DA3, [40, 40, 0, 2])]),
    ("fire view 8495H..854EH", 0x8495, 0, 0x854E, TACTICAL),
    ("fire exit 85C3H", 0x85C3, 0, None, TACTICAL),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--port", type=int, default=8099)
    parser.add_argument("--only", help="substring filter for scenario names")
    parser.add_argument("--save", type=pathlib.Path,
                        help="store TVC output state per scenario in this directory")
    parser.add_argument("--compare", type=pathlib.Path,
                        help="compare TVC output state with a --save directory")
    arguments = parser.parse_args()
    if arguments.save:
        arguments.save.mkdir(parents=True, exist_ok=True)
    mismatches = 0
    build = Build()
    emu = Emulator(arguments.port)
    rows = []
    try:
        for name, target, a, stop, state in SCENARIOS:
            if arguments.only and arguments.only not in name:
                continue
            emu.command(cmd="load_snapshot", path=str(SNAPSHOT))
            emu.command(cmd="pause")
            install_original(emu)
            original = call(emu, target, a, stop, state)
            emu.command(cmd="load_snapshot", path=str(SNAPSHOT))
            emu.command(cmd="pause")
            rebuild = build.install(emu)
            if "fire exit" in name:
                emu.write(build.run("TVC_PALETTE_ID_RUN"), [6])
            port = call(emu, target, a, stop, state)
            rows.append((name, original, port))
            output = (emu.read(0x0000, 0x3000, "vid0") + emu.read(0x5800, 0x300)
                      + emu.read(0x5DA5, 1) + emu.read(0x5D00, 2))
            key = "".join(c if c.isalnum() else "_" for c in name)
            verdict = ""
            if arguments.save:
                (arguments.save / f"{key}.bin").write_bytes(output)
            if arguments.compare:
                expected = (arguments.compare / f"{key}.bin").read_bytes()
                diff = sum(x != y for x, y in zip(expected, output))
                verdict = "  same" if diff == 0 else f"  DIFF {diff} bytes"
                mismatches += diff != 0
            print(f"{name:28s} zx {original:>10,d} T {original / ZX_HZ * 1000:8.1f} ms"
                  f"   tvc {port:>10,d} T {port / TVC_HZ * 1000:8.1f} ms"
                  f"   x{port / original * ZX_HZ / TVC_HZ:5.2f} time{verdict}",
                  flush=True)
        print(f"(palette rebuild at install: {rebuild:,d} T)")
    finally:
        emu.close()
    return 1 if mismatches else 0


if __name__ == "__main__":
    sys.exit(main())
