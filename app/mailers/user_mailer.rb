class UserMailer < ApplicationMailer
  default from: "odin-facebook@example.com"

  def welcome_email
    @user = params[:user]
    mail to: @user.email, subject: "Thanks for Signing Up"
  end
end
