/* Keyboard and accessibility support for the legacy anchor-based controls.
 * This file does not alter game rules, AI decisions, or certificate playback.
 */
(function () {
  "use strict";

  function init() {
    var controls = document.querySelectorAll("a:not([href])");
    var corners = { tl: "Top left", tr: "Top right", bl: "Bottom left", br: "Bottom right" };
    controls.forEach(function (control) {
      control.setAttribute("role", "button");
      control.setAttribute("tabindex", "0");
      if (control.hasAttribute("data-corner")) {
        control.setAttribute("aria-label", corners[control.getAttribute("data-corner")] + " corner");
      } else if (control.hasAttribute("data-orient")) {
        control.setAttribute("aria-label", control.getAttribute("data-orient") === "row"
          ? "Row-first spiral" : "Column-first spiral");
      }
    });

    function sync() {
      var toggle = document.querySelector(".super-toggle");
      var running = toggle.classList.contains("super-on");
      var selectedSpeed = document.querySelector(".super-speed.selected");
      var headless = selectedSpeed && selectedSpeed.getAttribute("data-speed") === "headless";
      toggle.setAttribute("aria-pressed", String(running));
      controls.forEach(function (control) {
        if (control.matches(".super-chip, .super-corner-cell, .super-spiral")) {
          control.setAttribute("aria-pressed", String(control.classList.contains("selected")));
          var disabled = running;
          if (control.hasAttribute("data-speed")) {
            disabled = running && ((control.getAttribute("data-speed") === "headless") !== headless);
          }
          control.setAttribute("aria-disabled", String(disabled));
        }
      });
    }

    // Capture before the game's document-level Space-to-restart handler.
    document.addEventListener("keydown", function (event) {
      var control = event.target.closest && event.target.closest('[role="button"]');
      if (!control || (event.key !== "Enter" && event.key !== " ")) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      if (!event.repeat && control.getAttribute("aria-disabled") !== "true") control.click();
    }, true);

    sync();
    new MutationObserver(sync).observe(document.querySelector(".super-panel"), {
      attributes: true, attributeFilter: ["class"], subtree: true
    });
  }

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init);
  else init();
}());
