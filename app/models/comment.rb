class Comment < ApplicationRecord
  validates :body, presence: true
  validates :author, presence: true
  belongs_to :post
end
