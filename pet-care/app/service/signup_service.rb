class SignupService < ApplicationService

  def initialize(user)
    @user = user
  end

  def call
    @user.user_pending_validation!

    if @user.save
      factor = FactorValidation.new(user: @user, ttl: generate_ttl(1))
      factor.factor_pending_validation!
      factor.save

      application_url = ENV["APPLICATION_URL"]
      activation_path = "/account/activate/"
      activation_link = "#{application_url}#{activation_path}#{factor.id}"

      UserMailer.with(user: @user, activation_link: activation_link).account_activation.deliver_now

      true

    else
      false
    end
  end

  private
  def generate_ttl(amount)
    amount.days.from_now.getutc
  end

end
