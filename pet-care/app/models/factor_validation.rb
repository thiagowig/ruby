class FactorValidation < ApplicationRecord
  belongs_to :user

  enum status: { inactive_factor: 0, active_factor: 1, factor_pending_validation: 2 }
end
