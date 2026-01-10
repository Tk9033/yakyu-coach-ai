document.addEventListener("turbo:load", () => {
  const input = document.getElementById("search-input");
  const hint  = document.getElementById("search-hint");

  if (!input || !hint) return;

  document.addEventListener("click", (event) => {
    const btn = event.target.closest(".js-related-term");
    if (!btn) return;

    const term = btn.dataset.relatedTerm;

    // ① 入力欄にセット
    input.value = term;
    input.focus();

    // ② メッセージ表示（viewのテンプレを使用）
    const template = hint.dataset.template;
    hint.textContent = template.replace("__TERM__", term);
    hint.classList.remove("hidden");
  });
});