class Post < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true
  belongs_to :user, optional: true
  has_many :comments
end
