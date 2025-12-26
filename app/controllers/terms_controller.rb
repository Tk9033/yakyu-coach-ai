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

    client = OpenAI::Client.new

    begin

      # OpenAI API 呼び出し
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

    rescue OpenAI::Error => e
      Rails.logger.error("OpenAI API error: #{e.message}")

      @error_message = "AIとの通信中にエラーが発生しました。しばらくしてから再度お試しください。"

    rescue StandardError => e
      Rails.logger.error("Unexpected error: #{e.message}")

      @error_message = "予期せぬエラーが発生しました。"

    ensure
      render :index
    end
  end
end
