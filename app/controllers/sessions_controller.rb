class SessionsController < ApplicationController
  def omniauth
    auth = request.env['omniauth.auth']

    # 念のため nil ガード
    unless auth
      redirect_to root_path, alert: "認証に失敗しました"
      return
    end

    user = User.find_or_create_by(
      provider: auth.provider,
      uid: auth.uid
    ) do |u|
      u.email = auth.info.email
      u.name  = auth.info.name
      u.password = Devise.friendly_token[0, 20]
    end

    sign_in(user)
    redirect_to root_path, notice: "ログインしました"
  end
end
