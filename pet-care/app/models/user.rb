class User < ApplicationRecord

  before_save { self.email = email.downcase}

  has_many :pets, dependent: :destroy
  has_many :factor_validations, dependent: :restrict_with_exception
  has_one_attached :image
  has_secure_password
  encrypts :email, deterministic: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  enum status: { inactive_user: 0, active_user: 1, user_pending_validation: 2 }

  def displayed_image
    if image.attached?
      image
    else
      "profile.jpg"
    end
  end

end
