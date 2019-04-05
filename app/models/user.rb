class User < ApplicationRecord
  has_secure_password

  validates :username, :email, uniqueness: true
  validates :username, :email, :phone, :password, presence: true
end
