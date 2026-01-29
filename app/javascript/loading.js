document.addEventListener("turbo:submit-start", () => {
  const loading = document.getElementById("loading");
  if (!loading) return;

  loading.classList.remove("loading-hidden");
});

document.addEventListener("turbo:submit-end", () => {
  const loading = document.getElementById("loading");
  if (!loading) return;

  loading.classList.add("loading-hidden");
});