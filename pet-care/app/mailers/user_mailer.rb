class UserMailer < ApplicationMailer

  default from: "contact@example.com"

  def account_activation
    @user = params[:user]
    @activation_link = params[:activation_link]

    mail(to: @user.email, subject: "Pet Care: Activate your account")
  end
end
