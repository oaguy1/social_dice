class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, uniqueness:true, presence: true,
    format: { with: VALID_EMAIL_REGEX }
  validates :user_name, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password
end
