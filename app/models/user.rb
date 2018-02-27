class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :posts
  has_many :comments

end
