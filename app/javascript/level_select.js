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
    const page = document.getElementById("level-select");
    if (!page) return;

    const mode = page.dataset.mode;

    document.querySelectorAll(".decide-button").forEach(button => {
      button.addEventListener("click", (event) => {
        const card = event.currentTarget.closest("[data-level]");
        if (!card) return;

        const level = card.dataset.level;
        localStorage.setItem("selectedLevel", level);

        // 文言切り替え
        const message =
        mode === "edit"
          ? `理解度を「${levelLabel(level)}」に変更しました`
          : `理解度を「${levelLabel(level)}」に設定しました`;

        showFlash(message);
      });
    });
  });