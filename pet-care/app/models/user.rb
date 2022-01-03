class User < ApplicationRecord

  before_save { self.email = email.downcase}

  has_many :pets, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

end
