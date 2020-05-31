class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}
end
