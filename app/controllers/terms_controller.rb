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

    # 利用回数制限チェック
    limiter = Chatgpt::UsageLimiter.new(
      key: usage_key,
      signed_in: user_signed_in?
    )

    result = limiter.check_and_increment

    unless result.allowed?
      @limit_exceeded = true

      return render :index
    end

    @result = Ai::SearchService.new(
      term: query,
      level: level
    ).call

    render :index
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("[SearchService Error] #{e.record.errors.full_messages.join(', ')}")
    @error_message = t("terms.error.unexpected")
    render :index, status: :unprocessable_entity
  rescue StandardError => e
    Rails.logger.error("[Search Error] #{e.class}: #{e.message}")
    @error_message = t("terms.error.unexpected")
    render :index, status: :internal_server_error
  end

  def suggestions
    query = (params[:q] || params[:query]).to_s.strip

    return render json: [] if query.blank?

    terms = BaseballTerm
              .where("name ILIKE ?", "#{query}%")
              .order(:name)
              .limit(10)
              .pluck(:name)

    render json: terms
  end
end