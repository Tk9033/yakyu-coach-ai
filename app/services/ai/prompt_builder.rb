module Ai
  class PromptBuilder
    def self.build(word:, level:)
      case level.to_sym
      when :beginner
        beginner_prompt(word)
      when :intermediate
        intermediate_prompt(word)
      when :advanced
        advanced_prompt(word)
      else
        beginner_prompt(word)
      end
    end

    COMMON_RULES = <<~PROMPT.freeze
      以下の用語について、Markdown形式で説明してください。

      【共通ルール】
      - 見出し語は出力しない
      - 文章は短く、読みやすくする
      - 1文ごとに改行する
    PROMPT

    COMMON_DEFINITION_RULE = <<~PROMPT.freeze
      最初に **太字で1文の定義** を書くこと。
      - 「いつ・誰が・何を」が必ず分かる文にする
    PROMPT

    COMMON_EMPHASIS_RULES = <<~PROMPT.freeze
      【強調ルール】
      - 用語名・主体・重要な動作・結果を **太字** にする
      - 抽象的な意味ではなく、文章中の語句をそのまま太字にする
      - 1文につき太字は最大2か所まで
    PROMPT

    def self.beginner_prompt(word)
      <<~PROMPT
        あなたは野球初心者向けの解説者です。

        【条件】
        - 野球の専門用語は使わない（使う場合は必ず言い換える）
        - 基本用語（ストライク、バッター等）は使用可

        #{COMMON_RULES}
        #{COMMON_DEFINITION_RULE}

        次に、用語の説明文を書く（約100文字）。
        - 1文ごとに改行する

        （ここで必ず1行空ける）

        最後に、日常的な動作やスポーツ以外の例えを書く（約100文字）。
        - 1文ごとに改行する

        #{COMMON_EMPHASIS_RULES}

        用語：#{word}
      PROMPT
    end

    def self.intermediate_prompt(word)
      <<~PROMPT
        あなたは野球観戦を楽しむ中級者向けの解説者です。

        【条件】
        - 基本的な野球用語は使用可
        - 観戦中に「今何が起きているか」が分かる説明にする
        - 例え話は書かない

        #{COMMON_RULES}
        #{COMMON_DEFINITION_RULE}

        次に、用語の説明文を書く（約150文字）。
        - 観戦視点を含める
        - 1文ごとに改行する

        （ここで必ず1行空ける）

        最後に、観戦時に注目すべきポイントを書く（約100文字）。
        - 1文ごとに改行する

        #{COMMON_EMPHASIS_RULES}

        用語：#{word}
      PROMPT
    end

    def self.advanced_prompt(word)
      <<~PROMPT
        あなたは野球経験者向けの解説者です。

        【条件】
        - 専門用語・戦術的視点を含める
        - プレーの背景や選択意図を説明する
        - 例え話は書かない

        #{COMMON_RULES}
        #{COMMON_DEFINITION_RULE}

        次に、技術・戦術の説明を書く（約200文字）。
        - 状況・判断・選択理由を含める
        - 1文ごとに改行する

        （ここで必ず1行空ける）

        最後に、戦術背景・チーム戦略・データ的視点を書く（約150文字）。
        - 1文ごとに改行する

        #{COMMON_EMPHASIS_RULES}

        用語：#{word}
      PROMPT
    end
  end
end