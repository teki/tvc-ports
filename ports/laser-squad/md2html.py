#!/usr/bin/env python3
"""Convert manual/LaserSquad.md to a single self-contained HTML file.

Handles the Markdown subset the manual uses (headings, paragraphs, lists,
tables, blockquotes, rules, images, emphasis, code). Images stay separate
files: the images/ folder is copied next to the HTML and referenced
relatively, which keeps the HTML small. Standard library only.

Usage: md2html.py [input.md [output.html]]
With no arguments every manual/LaserSquad*.md is converted to dist/<name>.html
(LaserSquad.md -> English, LaserSquad.hu.md -> Hungarian).
"""

import html
import pathlib
import re
import shutil
import sys

PORT_ROOT = pathlib.Path(__file__).resolve().parent

CSS = """
body{font:16px/1.55 Georgia,serif;max-width:50rem;margin:2rem auto;padding:0 1rem;color:#222}
h1,h2,h3,h4{font-family:Helvetica,Arial,sans-serif;line-height:1.25}
h1{border-bottom:2px solid #333;padding-bottom:.2em}
h2{border-bottom:1px solid #aaa;padding-bottom:.15em;margin-top:2em}
img{max-width:100%;height:auto}
table{border-collapse:collapse;margin:1em 0}
th,td{border:1px solid #999;padding:.25em .6em;text-align:left;vertical-align:top}
th{background:#eee}
blockquote{margin:1em 0;padding:.2em 1em;border-left:4px solid #888;background:#f5f5f5}
code{background:#f0f0f0;padding:0 .25em;border-radius:3px}
@media print{body{max-width:none;margin:0}h2{break-after:avoid}img,table{break-inside:avoid}}
"""


def inline(text, base):
    parts = re.split(r"(`[^`]+`)", text)
    out = []
    for part in parts:
        if part.startswith("`") and part.endswith("`") and len(part) > 1:
            out.append("<code>%s</code>" % html.escape(part[1:-1]))
            continue
        t = html.escape(part, quote=False)
        t = re.sub(r"!\[([^\]]*)\]\(([^)]+)\)",
                   r'<img alt="\1" src="\2">', t)
        t = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r'<a href="\2">\1</a>', t)
        t = re.sub(r"\*\*(.+?)\*\*", r"<strong>\1</strong>", t)
        t = re.sub(r"(?<![\w*])\*(?!\s)(.+?)(?<!\s)\*(?![\w*])", r"<em>\1</em>", t)
        out.append(t)
    return "".join(out)


def split_row(line):
    return [c.strip() for c in line.strip().strip("|").split("|")]


def convert(md, base, lang="en"):
    lines = md.splitlines()
    out = []
    i = 0
    title = "Laser Squad"
    while i < len(lines):
        line = lines[i]
        if not line.strip():
            i += 1
        elif re.match(r"^-{3,}\s*$", line):
            out.append("<hr>")
            i += 1
        elif m := re.match(r"^(#{1,6})\s+(.*)", line):
            n = len(m.group(1))
            if n == 1 and not out:
                title = m.group(2)
            out.append("<h%d>%s</h%d>" % (n, inline(m.group(2), base), n))
            i += 1
        elif line.startswith(">"):
            buf = []
            while i < len(lines) and lines[i].startswith(">"):
                buf.append(lines[i].lstrip(">").strip())
                i += 1
            out.append("<blockquote><p>%s</p></blockquote>" % inline(" ".join(buf), base))
        elif line.lstrip().startswith("|") and i + 1 < len(lines) and re.match(r"^\s*\|[\s:|-]+\|\s*$", lines[i + 1]):
            head = split_row(line)
            i += 2
            rows = []
            while i < len(lines) and lines[i].lstrip().startswith("|"):
                rows.append(split_row(lines[i]))
                i += 1
            t = ["<table><thead><tr>%s</tr></thead><tbody>" % "".join("<th>%s</th>" % inline(c, base) for c in head)]
            for r in rows:
                t.append("<tr>%s</tr>" % "".join("<td>%s</td>" % inline(c, base) for c in r))
            t.append("</tbody></table>")
            out.append("".join(t))
        elif re.match(r"^\s*([-*]|\d+\.)\s+", line):
            ordered = bool(re.match(r"^\s*\d+\.", line))
            tag = "ol" if ordered else "ul"
            pat = r"^\s*\d+\.\s+(.*)" if ordered else r"^\s*[-*]\s+(.*)"
            items = []
            while i < len(lines):
                m = re.match(pat, lines[i])
                if m:
                    items.append(m.group(1))
                    i += 1
                elif lines[i].strip() and lines[i].startswith(" ") and items:
                    items[-1] += " " + lines[i].strip()
                    i += 1
                else:
                    break
            out.append("<%s>%s</%s>" % (tag, "".join("<li>%s</li>" % inline(x, base) for x in items), tag))
        else:
            buf = []
            while i < len(lines) and lines[i].strip() and not re.match(
                    r"^(#{1,6}\s|>|\s*\||-{3,}\s*$|\s*([-*]|\d+\.)\s+)", lines[i]):
                buf.append(lines[i].strip())
                i += 1
            if not buf:  # unrecognised construct: emit the line rather than loop
                buf.append(lines[i].strip())
                i += 1
            out.append("<p>%s</p>" % inline(" ".join(buf), base))
    body = "\n".join(out)
    return ('<!doctype html>\n<html lang="%s"><head><meta charset="utf-8">'
            '<meta name="viewport" content="width=device-width,initial-scale=1">'
            "<title>%s</title><style>%s</style></head><body>\n%s\n</body></html>\n"
            % (lang, html.escape(title), CSS, body))


def convert_file(src, dst):
    m = re.search(r"\.([a-z]{2})\.md$", src.name)
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(convert(src.read_text(encoding="utf-8"), src.parent, m.group(1) if m else "en"),
                   encoding="utf-8")
    images = src.parent / "images"
    if images.is_dir():
        shutil.copytree(images, dst.parent / "images", dirs_exist_ok=True)
    print("wrote %s (%d bytes)" % (dst, dst.stat().st_size))


def main(argv):
    if len(argv) > 1:
        src = pathlib.Path(argv[1])
        dst = pathlib.Path(argv[2]) if len(argv) > 2 else PORT_ROOT / "dist" / (src.name[:-3] + ".html")
        convert_file(src, dst)
        return
    for src in sorted((PORT_ROOT / "manual").glob("LaserSquad*.md")):
        convert_file(src, PORT_ROOT / "dist" / (src.name[:-3] + ".html"))


if __name__ == "__main__":
    main(sys.argv)
