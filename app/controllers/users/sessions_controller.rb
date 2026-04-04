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
    redirect_to new_level_path, notice: "ゲストとしてログインしました", status: :see_other
  end
end