class BookComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :book
  
  validates :comment, presence: true, length: {minimum: 2, maximum: 50}
end
