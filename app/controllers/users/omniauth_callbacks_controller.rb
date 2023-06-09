class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :facebook

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # this will throw if @user is not activated
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      # Removing extra as it can overflow some session stores
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
