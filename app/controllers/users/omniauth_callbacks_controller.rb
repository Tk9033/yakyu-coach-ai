class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :google_oauth2

  def google_oauth2
    auth = request.env["omniauth.auth"]
    return redirect_to root_path, alert: t("auth.google_auth_info_missing") if auth.nil?

    @user = User.from_omniauth(auth)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_path, alert: t("auth.login_failed")
    end
  end

  def failure
    redirect_to root_path, alert: t("auth.google_login_failed")
  end
end