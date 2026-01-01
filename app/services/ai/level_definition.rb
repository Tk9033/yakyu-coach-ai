module Ai
  class LevelDefinition
    LEVELS = {
      beginner: {
        label: "初心者",
        persona: {
          experience: "野球の経験なし",
          knowledge: "アウトやストライクなどの基本概念も曖昧",
          target: "基礎の基礎から知りたい人"
        },
        prompt_rule: {
          allow_terms: false,
          explain_from_basic: true,
          use_analogy: true,
          detail: :very_low
        }
      },

      intermediate: {
        label: "中級者",
        persona: {
          experience: "テレビ観戦やゲームで野球を楽しむ",
          knowledge: "盗塁・四球・ホームランなどの基本用語は理解",
          target: "基本はわかるが、より深く楽しみたい人"
        },
        prompt_rule: {
          allow_terms: true,
          explain_from_basic: false,
          add_tactical_hint: true,
          detail: :medium
        }
      },

      advanced: {
        label: "上級者",
        persona: {
          experience: "野球経験あり、または観戦が趣味",
          knowledge: "ヒットエンドランやカウント有利不利など基本戦術を理解",
          target: "プレーや戦術の背景まで理解したい人"
        },
        prompt_rule: {
          allow_terms: true,
          add_strategy_background: true,
          detail: :high
        }
      }
    }.freeze

    def self.fetch(level)
      LEVELS[level.to_sym]
    end

    def self.valid?(level)
      LEVELS.key?(level.to_sym)
    end

    def self.label(level)
      fetch(level)&.dig(:label) || "初心者"
    end

    def self.all_for_view
      LEVELS.map do |key, data|
        {
          key: key,
          label: data[:label],
          descriptions: data.dig(:ui, :descriptions),
          note: data.dig(:ui, :note)
        }
      end
    end
  end
end