class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :posts
  has_many :comments
  acts_as_follower
  acts_as_followable

  def timeline
    user_ids = following_users.pluck(:id)
    user_ids.push(id)
    Post.where(user_id: user_ids).order('created_at DESC')
  end

end
