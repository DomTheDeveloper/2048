#!/usr/bin/env python3
"""Dependency-free release regression checks; run from any directory."""
from html.parser import HTMLParser
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]


class PageLinks(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links = []
        self.scripts = []

    def handle_starttag(self, tag, attrs):
        values = dict(attrs)
        for key in ("href", "src"):
            if key in values:
                self.links.append(values[key])
        if tag == "script" and values.get("src"):
            self.scripts.append(values["src"])


def check_link(source, target):
    parsed = urlsplit(target)
    if parsed.scheme or parsed.netloc or not parsed.path:
        return
    path = ROOT / unquote(parsed.path.lstrip("/")) if parsed.path.startswith("/") else source.parent / unquote(parsed.path)
    if not path.exists():
        raise AssertionError("Broken local link: %s -> %s" % (source.relative_to(ROOT), target))


def documentation_checks():
    sources = [ROOT / "README.md", ROOT / "CONTRIBUTING.md", ROOT / "witness/README.md"]
    sources += sorted((ROOT / "docs").glob("*.md"))
    count = 0
    for source in sources:
        text = source.read_text(encoding="utf-8")
        # These maintained guides use ordinary inline links, not reference definitions.
        for target in re.findall(r"\]\(([^\s)]+)\)", text):
            check_link(source, target)
            count += 1
        if "DomTheDeveloper/2048-undo" in text or "github.io/2048-undo" in text:
            raise AssertionError("Outdated project URL in " + str(source))
    page = PageLinks()
    html = (ROOT / "index.html").read_text(encoding="utf-8")
    page.feed(html)
    for target in page.links:
        check_link(ROOT / "index.html", target)
        count += 1
    assert not any(urlsplit(src).scheme or urlsplit(src).netloc for src in page.scripts), "Unexpected third-party script"
    assert "google-analytics.com" not in html and "UA-2373559-12" not in html, "Inherited analytics tracker"
    assert 'lang="en"' in html, "Page language missing"
    assert "user-scalable=no" not in html and "maximum-scale=1" not in html, "Browser zoom disabled"
    for name in ("CITATION.cff", "CITATION.bib"):
        citation = (ROOT / name).read_text(encoding="utf-8")
        assert "2048-undo" not in citation and "claude/super-mode" not in citation, "Stale citation URL"
    return count


def witness_checks():
    node = shutil.which("node")
    if not node:
        raise RuntimeError("Node.js is required for independent engine checks.")
    opening = "start 0 0 2\nstart 0 1 2\n"
    valid = {
        "opening": (opening, 0, 0),
        "one-merge": (opening + "L 1 1 2\n", 1, 4),
        "comments": ("# header\n\n" + opening + "L 1 1 2 # spawn\n", 1, 4),
        "signed-integers": ("start +0 +0 +2\nstart 0 1 4\n", 0, 0),
    }
    invalid = {
        "empty": "",
        "one-opening-tile": "start 0 0 2\n",
        "duplicate-opening": "start 0 0 2\nstart 0 0 2\n",
        "third-opening-tile": opening + "start 2 2 2\n",
        "late-opening": opening + "L 1 1 2\nstart 2 2 4\n",
        "negative-opening-row": "start -1 0 2\nstart 0 1 2\n",
        "negative-opening-column": "start 0 -1 2\nstart 0 1 2\n",
        "out-of-range-opening-row": "start 4 0 2\nstart 0 1 2\n",
        "out-of-range-opening-column": "start 0 4 2\nstart 0 1 2\n",
        "negative-spawn-row": opening + "L -1 1 2\n",
        "negative-spawn-column": opening + "L 1 -1 2\n",
        "out-of-range-spawn-row": opening + "L 4 1 2\n",
        "out-of-range-spawn-column": opening + "L 1 4 2\n",
        "extra-opening-field": "start 0 0 2 extra\nstart 0 1 2\n",
        "extra-move-field": opening + "L 1 1 2 extra\n",
        "missing-opening-field": "start 0 2\nstart 0 1 2\n",
        "missing-move-field": opening + "L 1 2\n",
        "noninteger-coordinate": "start 0.5 0 2\nstart 0 1 2\n",
        "integer-with-underscore": "start 0_0 0 2\nstart 0 1 2\n",
        "unicode-coordinate": "start ٠ 0 2\nstart 0 1 2\n",
        "noninteger-value": "start 0 0 two\nstart 0 1 2\n",
        "illegal-opening-value": "start 0 0 8\nstart 0 1 2\n",
        "zero-spawn-value": opening + "L 1 1 0\n",
        "illegal-spawn-value": opening + "L 1 1 8\n",
        "unknown-direction": opening + "X 1 1 2\n",
        "prototype-direction": opening + "__proto__ 1 1 2\n",
        "move-before-opening": "L 1 1 2\n",
        "no-op-slide": "start 0 0 2\nstart 0 1 4\nL 1 1 2\n",
        "occupied-spawn": opening + "L 0 0 2\n",
    }
    runners = {
        "Python": [sys.executable, str(ROOT / "verify/verify2048.py")],
        "engine": [node, str(ROOT / "test/replay_engine.js")],
    }
    total = 0
    with tempfile.TemporaryDirectory(prefix="2048-parsers-") as temp:
        file = Path(temp) / "case.txt"
        for name, text in list((name, value[0]) for name, value in valid.items()) + list(invalid.items()):
            file.write_text(text, encoding="utf-8")
            for runner, command in runners.items():
                result = subprocess.run(command + [str(file)], cwd=ROOT, text=True, capture_output=True, timeout=20)
                output = result.stdout + result.stderr
                accepted = result.returncode == 0 and re.search(r"Certificate:\s+VALID\b", output)
                expected = name in valid
                if bool(accepted) != expected:
                    raise AssertionError("%s/%s: unexpected acceptance=%s\n%s" % (runner, name, bool(accepted), output))
                if not expected and result.returncode == 0:
                    raise AssertionError("%s/%s: rejection must return nonzero" % (runner, name))
                if expected:
                    for label, value in (("Steps verified", valid[name][1]), ("Score", valid[name][2])):
                        assert re.search(re.escape(label) + r":\s+" + str(value) + r"\b", output), output
                total += 1
    return total


def main():
    links = documentation_checks()
    cases = witness_checks()
    print("PASS: %d documentation/asset links inspected; %d independent parser cases." % (links, cases))
    print("Scope: local link targets and explicit regression examples, not full formal verification.")


if __name__ == "__main__":
    try:
        main()
    except (AssertionError, OSError, RuntimeError, subprocess.TimeoutExpired) as error:
        sys.exit("FAIL: " + str(error))
