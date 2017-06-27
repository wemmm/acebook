class Post < ApplicationRecord
  has_many :comments
  validates :message, presence: true
end
