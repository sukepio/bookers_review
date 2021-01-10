class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true, length: {minimum: 2, maximum: 50}
  attachment :profile_image
  
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :follower, source: :followed
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :followed, source: :follower
  
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
end
