module Ai
  class LevelUiDefinition
    UI_LEVELS = {
      beginner: {
        label: "初心者",
        descriptions: [
          "野球の経験がほとんどない",
          "アウトやストライクなど基本概念があいまい",
          "基礎からやさしく知りたい"
        ],
        note: "はじめて野球用語を学ぶ方向け"
      },
      intermediate: {
        label: "中級者",
        descriptions: [
          "テレビやゲームで野球を楽しむ",
          "基本用語は理解している",
          "観戦ポイントの補足があると嬉しい"
        ],
        note: "基本はわかるが、より深く楽しみたい人向け"
      },
      advanced: {
        label: "上級者",
        descriptions: [
          "野球経験あり、または観戦が趣味",
          "戦術を理解している",
          "背景や戦略まで知りたい"
        ],
        note: "戦術の背景まで理解したい人向け"
      }
    }.freeze

    def self.all
      UI_LEVELS.map do |key, data|
        data.merge(key: key)
      end
    end
  end
end