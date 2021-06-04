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
    if search_type == "完全一致"
      @objects = User.where(name: @keyword)
    elsif search_type == "前方一致"
      @objects = User.where("name LIKE ?", "%#{@keyword}" )
    elsif search_type == "後方一致"
      @objects = User.where("name LIKE ?", "#{@keyword}%" )
    elsif search_type == "部分一致"
      @objects = User.where("name LIKE ?", "%#{@keyword}%" )
    end
  end

end
