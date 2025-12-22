document.addEventListener("turbo:load", () => {
  const page = document.getElementById("level-select");
  if (!page) return;

  const mode = page.dataset.mode;

  document.querySelectorAll(".decide-button").forEach(button => {
    button.addEventListener("click", () => {
      // カードから level を取得
      const card = button.closest("[data-level]");
      if (!card) return;

      const level = card.dataset.level;

      // 初回選択（new）のときだけ JS で処理
      if (mode === "new") {
        // （必要なら localStorage に保存）
        localStorage.setItem("selectedLevel", level);

        // 初回は検索画面へ遷移
        window.location.href = "/terms";
        return;
      }

    });
  });
});