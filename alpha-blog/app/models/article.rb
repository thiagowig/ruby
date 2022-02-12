class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10 }
  validates :description, presence: true,  length: { maximum: 10 }
end
