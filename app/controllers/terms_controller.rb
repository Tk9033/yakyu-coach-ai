class TermsController < ApplicationController

  def index
  end

  def search
    query = params[:query]
    level = session[:level] || params[:level] || "beginner"

    # ガード処理
    unless Ai::LevelDefinition.valid?(level)
      level = "beginner"
    end

    session[:level] = level

    # プロンプト生成
    prompt = Ai::PromptBuilder.build(
      word: query,
      level: level
    )

    # OpenAI API 呼び出し
    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          { role: "system", content: "あなたは野球用語を解説するアシスタントです。" },
          { role: "user", content: prompt }
        ]
      }
    )

    # AIの回答を取得
    ai_text = response.dig("choices", 0, "message", "content")

    # View に渡す
    @result = {
      title: query,
      level: level,
      description: ai_text
    }

    render :index
  end
end
