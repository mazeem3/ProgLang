class Post < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true
  has_many :comments
end
