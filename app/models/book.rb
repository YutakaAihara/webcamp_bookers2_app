class Book < ApplicationRecord

  # UserモデルとN対1の関係にある（複数の本が、1人のユーザーと紐づいている）
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum:200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search_type, keyword)
    if search_type == "perfect"
      Book.where(title: keyword)
    elsif search_type == "forward"
      Book.where("title LIKE ?", "#{keyword}%" )
    elsif search_type == "rear"
      Book.where("title LIKE ?", "%#{keyword}" )
    elsif search_type == "partial"
      Book.where("title LIKE ?", "%#{@keyword}%" )
    end
  end
end
