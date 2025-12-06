// app/javascript/level_select.js

function showFlash(message) {
    const flash = document.getElementById("flash-message");
    if (!flash) return;

    flash.textContent = message;
    flash.classList.remove("hidden");

  }

  function levelLabel(level) {
    switch (level) {
      case "beginner":
        return "初心者";
      case "intermediate":
        return "中級者";
      case "advanced":
        return "上級者";
      default:
        return "";
    }
  }

  document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".decide-button").forEach(button => {
      button.addEventListener("click", (event) => {
        const card = event.currentTarget.closest("[data-level]");
        if (!card) return;

        const level = card.dataset.level;

        localStorage.setItem("selectedLevel", level);
        showFlash(`理解度を「${levelLabel(level)}」に設定しました`);
      });
    });
  });