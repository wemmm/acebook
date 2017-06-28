class User < ApplicationRecord

  validates :email, :password_digest, :username, presence: true
  validates :email, :username, uniqueness: true

  has_secure_password

end
