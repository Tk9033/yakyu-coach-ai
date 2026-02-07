class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # OmniAuth 用
  skip_before_action :verify_authenticity_token, if: :devise_controller?

  before_action :set_guest_id

  private

  def set_guest_id
    cookies.signed[:guest_id] ||= SecureRandom.uuid
  end

  def usage_key
    date = Time.current.strftime("%Y%m%d")

    if user_signed_in?
      "chatgpt:usage:user:#{current_user.id}:#{date}"
    else
      "chatgpt:usage:guest:#{cookies.signed[:guest_id]}:#{date}"
    end
  end
end
