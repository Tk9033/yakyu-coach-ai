class TermsController < ApplicationController
  def index
  end

  def search
    query = params[:query].to_s.strip
    level = session[:level] || params[:level] || "beginner"

    # ガード処理
    level = "beginner" unless Ai::LevelDefinition.valid?(level)
    session[:level] = level

    # 空検索の処理
    if query.blank?
      flash.now[:alert] = t("terms.flash.blank")
      return render :index
    end

    # プロンプト生成
    prompt = Ai::PromptBuilder.build(
      word: query,
      level: level
    )

    client = OpenAI::Client.new

    begin
      response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: [
            { role: "system", content: Ai::SystemPrompt::BASEBALL_TERM_GUARD },
            { role: "user", content: prompt }
          ]
        }
      )

      ai_text = response.dig("choices", 0, "message", "content").to_s

      related_terms = []

      json_regex = /\{\s*"related_terms"\s*:\s*\[[\s\S]*?\]\s*\}/

      if (match = ai_text.match(json_regex))
        begin
          parsed = JSON.parse(match[0])
          terms = parsed["related_terms"]
          related_terms = terms.is_a?(Array) ? terms : []
        rescue JSON::ParserError => e
          Rails.logger.warn("[RelatedTerms Parse Error] #{e.message}")
        end
      end

      description = ai_text.gsub(json_regex, "").strip

      @result = {
        title: query,
        level: level,
        description: description,
        related_terms: related_terms
      }
    rescue OpenAI::Error => e
      Rails.logger.error(
        "[OpenAI Error] type=#{e.class} message=#{e.message}"
      )
      @error_message = t("terms.error.openai")
    rescue StandardError => e
      Rails.logger.error(
        "[Unexpected Error] type=#{e.class} message=#{e.message}"
      )
      @error_message = t("terms.error.unexpected")
    end

    render :index
  end

  def suggestions
    query = (params[:q] || params[:query]).to_s.strip

    return render json: [] if query.blank?

    terms = BaseballTerm
              .where("name ILIKE ?", "#{query}%") # PostgresならILIKE推奨
              .order(:name)
              .limit(10)
              .pluck(:name)

    render json: terms
  end
end