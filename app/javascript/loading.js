document.addEventListener("turbo:load", () => {
  const loading = document.getElementById("loading");
  console.log("loading:", loading);

  const form = document.querySelector("form");
  console.log("form:", form);

  if (!loading || !form) return;

  form.addEventListener("submit", (event) => {
    event.preventDefault();

    loading.classList.remove("loading-hidden");

    setTimeout(() => {
      form.submit();
    }, 100);
  });
});