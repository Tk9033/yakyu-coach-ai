document.addEventListener("turbo:load", () => {
  const input = document.getElementById("search-input");
  if (!input) return;

  document.addEventListener("click", (event) => {
    const btn = event.target.closest(".js-related-term");
    if (!btn) return;

    input.value = btn.dataset.relatedTerm;
    input.focus();
  });
});
