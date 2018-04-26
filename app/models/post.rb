class Post < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true
  belongs_to :user, optional: true
  has_many :comments

  def self.search(search)
    where("title ILIKE ? OR author ILIKE ?",  "%#{search}%", "%#{search}%") 
  end
end
