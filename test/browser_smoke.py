#!/usr/bin/env python3
"""Optional Chromium smoke test. Requires Playwright; serves only on loopback."""
import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import shutil
import tempfile
import threading

ROOT = Path(__file__).resolve().parents[1]


class QuietHandler(SimpleHTTPRequestHandler):
    def log_message(self, *_args):
        pass


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args()
    output = args.output_dir or Path(tempfile.mkdtemp(prefix="2048-browser-"))
    output.mkdir(parents=True, exist_ok=True)
    try:
        from playwright.sync_api import sync_playwright
    except ImportError as error:
        raise SystemExit("Install Python Playwright and Chromium to run this optional test.") from error
    server = ThreadingHTTPServer(("127.0.0.1", 0), partial(QuietHandler, directory=str(ROOT)))
    thread = threading.Thread(target=server.serve_forever, daemon=True)
    thread.start()
    errors = []
    report = {"checks": [], "errors": errors, "scope": "Chromium smoke test, not an accessibility certification"}
    try:
        with sync_playwright() as playwright:
            executable = os.environ.get("CHROMIUM_PATH") or shutil.which("chromium")
            options = {"headless": True}
            if executable:
                options["executable_path"] = executable
            browser = playwright.chromium.launch(**options)
            report["browser"] = browser.version
            page = browser.new_page(viewport={"width": 1280, "height": 1000}, reduced_motion="reduce")
            page.on("pageerror", lambda error: errors.append(str(error)))
            page.on("console", lambda message: errors.append(message.text) if message.type == "error" else None)
            page.on("response", lambda response: errors.append("HTTP %s %s" % (response.status, response.url)) if response.status >= 400 else None)
            page.goto("http://127.0.0.1:%d/" % server.server_port, wait_until="networkidle")
            page.wait_for_function("window.game_manager && document.querySelector('.super-chip.selected')")
            assert page.title() == "2048 — Verified Play and Research"
            assert page.locator("h1").inner_text() == "2048"
            assert page.locator('a:not([href]):not([role="button"])').count() == 0
            assert page.locator('meta[name="viewport"]').get_attribute("content") == "width=device-width, initial-scale=1"
            report["checks"].append("page metadata, keyboard roles, and zoom")
            page.locator('[data-tiles="regular"]').click()
            page.locator('[data-undo="disabled"]').click()
            before = page.evaluate("JSON.stringify({grid:game_manager.grid.cells,seed:game_manager.seed})")
            random_button = page.locator('[data-algo="random"]')
            random_button.focus()
            page.keyboard.press("Space")
            page.wait_for_function("document.querySelector('[data-algo=random]').getAttribute('aria-pressed') === 'true'")
            after = page.evaluate("JSON.stringify({grid:game_manager.grid.cells,seed:game_manager.seed})")
            assert before == after, "Space on a control restarted the game"
            assert random_button.evaluate("el => getComputedStyle(el).outlineStyle") != "none"
            report["checks"].append("keyboard activation without accidental restart; visible focus")
            page.locator("h1").click()
            for direction in ("ArrowLeft", "ArrowDown", "ArrowRight", "ArrowUp"):
                page.keyboard.press(direction)
            assert page.evaluate("game_manager.undoStack.length") > 0
            report["checks"].append("ordinary keyboard moves through the live engine")
            page.locator('[data-speed="1"]').click()
            toggle = page.locator(".super-toggle")
            toggle.focus()
            page.keyboard.press("Enter")
            page.wait_for_function("document.querySelector('.super-toggle').getAttribute('aria-pressed') === 'true'")
            assert page.locator('[data-tiles="perfect"]').get_attribute("aria-disabled") == "true"
            page.keyboard.press("Enter")
            page.wait_for_function("document.querySelector('.super-toggle').getAttribute('aria-pressed') === 'false'")
            report["checks"].append("keyboard AI start/stop and disabled-state announcements")
            page.locator('[data-tiles="perfect"]').click()
            page.locator('[data-goal="tile"]').click()
            page.locator('[data-speed="headless"]').click()
            page.locator('[data-finale="hyper"]').click()
            toggle.click()
            page.wait_for_selector(".super-win-active", timeout=120000)
            moves = int(page.locator(".super-win-moves").inner_text().replace(",", ""))
            maximum = page.evaluate("Math.max.apply(null, game_manager.grid.cells.flat().map(t => t ? t.value : 0))")
            assert moves == 32781 and maximum == 131072, (moves, maximum)
            report["playback"] = {"rounds": moves, "maximum_tile": maximum}
            report["checks"].append("complete controlled 32,781-round witness in the browser worker")
            page.locator(".super-win-close").click()
            page.screenshot(path=str(output / "desktop.png"), full_page=True)
            widths = [320, 375, 768, 1280]
            for width in widths:
                page.set_viewport_size({"width": width, "height": 1000})
                page.evaluate("document.documentElement.getBoundingClientRect()")
                assert page.evaluate("document.documentElement.scrollWidth <= innerWidth"), "Horizontal overflow at %dpx" % width
                if width == 375:
                    page.screenshot(path=str(output / "mobile.png"), full_page=True)
            report["checks"].append("no horizontal overflow at " + ", ".join(map(str, widths)) + "px")
            assert not errors, errors
            report["status"] = "passed"
            browser.close()
    except Exception as error:
        report["status"] = "failed"
        report["failure"] = str(error)
        raise
    finally:
        server.shutdown()
        server.server_close()
        thread.join(timeout=5)
        (output / "browser-report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        print(json.dumps(report, indent=2))
        print("Browser evidence:", output)


if __name__ == "__main__":
    main()
