class User < ApplicationRecord
  validates :name, presence: true,length: {maximum: 15}
  VALID_EMAIL_REGEX = /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/
  validates :email, presence: true,
          format: { with: VALID_EMAIL_REGEX },
          uniqueness: true
  validates :password, presence: true,length: {minimum: 6}
  has_secure_password
end
