// app/javascript/level_select.js

console.log("=== application.js loaded ===")
document.addEventListener("turbo:load", () => {
  console.log("level_select.jsが読み込まれました！");

  // 1. 全ての 'decide-button' クラスのボタンを取得
  const decideButtons = document.querySelectorAll(".decide-button");

  decideButtons.forEach(button => {
    button.addEventListener("click", (event) => {
      // 2. クリックされたボタンの親要素（カード）を取得
      // closest() を使って、最も近い data-level 属性を持つ要素を探す
      const card = event.currentTarget.closest('[data-level]');
      
      if (card) {
        // 3. カードから data-level 属性の値を取得
        const level = card.dataset.level; // 例: "beginner", "intermediate", "advanced"
        
        alert(`選択されたレベル: ${level}`);
        
        // 🌟 ここに、レベルをサーバーに送信する処理などを記述します 🌟
      } else {
        alert("エラー: カード要素が見つかりませんでした。");
      }
    });
  });
});