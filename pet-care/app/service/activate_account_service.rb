class ActivateAccountService < ApplicationService

  def initialize(factor)
    @factor = factor
  end

  def call
    @factor.validated_factor!
    @factor.user.active_user!

    @factor.user.save
    @factor.save

    @factor.user.id
  end
end
