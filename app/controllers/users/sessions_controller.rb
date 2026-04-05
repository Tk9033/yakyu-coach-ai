module Users
  class SessionsController < Devise::SessionsController
    def guest_login
      if user_signed_in?
        redirect_to root_path
        return
      end

      user = User.find_or_create_by!(email: "guest@example.com") do |u|
        u.password = SecureRandom.urlsafe_base64
      end

      sign_in(:user, user)

      flash[:notice] = t("guest.flash.login")
      flash[:alert]  = t("guest.flash.restriction")

      redirect_to new_level_path, status: :see_other
    end
  end
end