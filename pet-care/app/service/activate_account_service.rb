class ActivateAccountService < ApplicationService

  def initialize(factor)
    @factor = factor
  end

  def call
    ActiveRecord::Base.transaction do
      @factor.validated_factor!
      @factor.user.active_user!
      @factor.user.save
      @factor.save
    end

    @factor.user.id
  end
end
