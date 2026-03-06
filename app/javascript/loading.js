document.addEventListener("turbo:submit-start", (event) => {
  const loading = document.getElementById("loading");
  if (!loading) return;

  // ★ 追加：リクエストの「Accept」ヘッダーに turbo-stream が含まれている場合は、
  // ローディングを表示せずに中断（return）する
  const fetchOptions = event.detail.formSubmission.fetchOptions;
  if (fetchOptions.headers['Accept']?.includes('text/turbo-stream')) {
    return;
  }

  loading.classList.remove("loading-hidden");
});

document.addEventListener("turbo:submit-end", () => {
  const loading = document.getElementById("loading");
  if (!loading) return;

  loading.classList.add("loading-hidden");
});