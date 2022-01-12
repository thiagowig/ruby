class UserMailer < ApplicationMailer

  def account_activation
    @user = params[:user]
    @activation_link = params[:activation_link]

    mail(to: @user.email, subject: "Pet Care: Activate your account")
  end
end
