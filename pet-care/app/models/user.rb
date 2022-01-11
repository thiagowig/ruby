class User < ApplicationRecord

  encrypts :email, deterministic: true

  before_save { self.email = email.downcase}

  has_many :pets, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

  enum status: { inactive_user: 0, active_user: 1, user_pending_validation: 2 }

end
