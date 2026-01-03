document.addEventListener("turbo:load", () => {
  const page = document.getElementById("level-select");
  if (!page) return;

  const form = document.getElementById("level-form");
  const input = document.getElementById("level-input");
  if (!form || !input) return;

  document.querySelectorAll(".decide-button").forEach((button) => {
    button.addEventListener("click", () => {
      const card = button.closest("[data-level]");
      if (!card) return;

      const level = card.dataset.level;

      input.value = level;

      // Controller に送る
      form.submit();
    });
  });
});