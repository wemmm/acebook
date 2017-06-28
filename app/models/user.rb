class User < ApplicationRecord

  validates :email, :password_digest, :username, presence: true

  has_secure_password

end
