class Book < ApplicationRecord
  
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
