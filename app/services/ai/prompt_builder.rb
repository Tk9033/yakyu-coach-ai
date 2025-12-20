module Ai
  class PromptBuilder
    def self.build(word:, level:)
      definition = LevelDefinition.fetch(level)
      rule = definition[:prompt_rule]

      case level.to_sym
      when :beginner
        beginner_prompt(word)
      when :intermediate
        intermediate_prompt(word)
      when :advanced
        advanced_prompt(word)
      end
    end

    def self.beginner_prompt(word)
      <<~PROMPT
        あなたは野球初心者向けの解説者です。
        以下の用語について説明してください。

        【条件】
        ・専門用語は使わない
        ・基礎から説明する
        ・日常的な例え話を使う

        【出力形式】
        1. 説明文（約100文字）
        2. 例え（約100文字）

        用語：#{word}
      PROMPT
    end

    def self.intermediate_prompt(word)
      <<~PROMPT
        あなたは野球観戦を楽しむ人向けの解説者です。

        【条件】
        ・基本的な野球用語は使用可
        ・観戦時の視点を含める

        【出力形式】
        1. 説明文（約150文字）
        2. 観戦ポイント（約100文字）

        用語：#{word}
      PROMPT
    end

    def self.advanced_prompt(word)
      <<~PROMPT
        あなたは野球経験者向けの解説者です。

        【条件】
        ・専門用語・戦術的視点を含める
        ・プレーの背景や意図を説明する

        【出力形式】
        1. 説明文（約200文字）
        2. 戦術背景（約150文字）

        用語：#{word}
      PROMPT
    end
  end
end