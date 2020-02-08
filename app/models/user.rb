class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :books, :dependent => :destroy

  has_many :marks, dependent: :destroy
  has_many :mark_books, through: :marks, source: :book
  
  
  #登録メソッド 
  def mark(book)
    marks.find_or_create_by(book_id: book.id)
  end

  #登録解除メソッド
  def unmark(book)
    mark = marks.find_by(book_id: book.id)
    mark.destroy if mark
  end

  #確認メソッド
  def checkmark?(book)
    self.mark_books.include?(book)
  end
  #self.booksのbooksはhas_manyで定義したものなので、subbooksとかになってたらそうする。
  
  
end