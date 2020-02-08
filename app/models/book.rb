class Book < ApplicationRecord
  validates :category, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 20000 }
  
  belongs_to :user
  
  has_many :marks, foreign_key: 'book_id', dependent: :destroy
  has_many :mark_users, through: :marks, source: :user
  
end
