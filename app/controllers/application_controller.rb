class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # OmniAuth 用（重要）
  skip_before_action :verify_authenticity_token, if: :devise_controller?
end
