class Users::SessionsController < Devise::SessionsController
  def guest_login
    if user_signed_in?
        redirect_to root_path
        return
    end

    user = User.find_or_create_by!(email: "guest@example.com") do |u|
        u.password = SecureRandom.urlsafe_base64
    end

    sign_in(:user, user)
    flash[:notice] = "ゲストとしてログインしました"
    flash[:alert]  = "ゲストでは解説文の保存はできません。ログインするとご利用いただけます。"

    redirect_to new_level_path, status: :see_other
  end
end