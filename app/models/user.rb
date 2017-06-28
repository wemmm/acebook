class User < ApplicationRecord

  validates :email, :password, :username, presence: true

  has_secure_password

end
