class User < ApplicationRecord

  has_many  :likes
  has_many :posts

  validates :email, :password_digest, :username, presence: true
  validates :email, :username, uniqueness: true

  has_secure_password

end
