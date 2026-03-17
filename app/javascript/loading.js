document.addEventListener("turbo:submit-start", (event) => {
  const loading = document.getElementById("loading");
  if (!loading) return;

  const fetchOptions = event.detail.formSubmission.fetchOptions;
  const accept = fetchOptions.headers.get("Accept");

  // ローディング非表示
  if (accept && accept.includes("turbo-stream")) return;

  loading.classList.remove("loading-hidden");
});


// ローディング表示
document.addEventListener("submit", (event) => {
  if (event.target.id !== "search-form") return;

  const loading = document.getElementById("loading");
  if (!loading) return;

  loading.classList.remove("loading-hidden");
});