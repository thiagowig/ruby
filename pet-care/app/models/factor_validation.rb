class FactorValidation < ApplicationRecord
  belongs_to :user

  enum status: { expired_factor: 0, validated_factor: 1, factor_pending_validation: 2 }
end
