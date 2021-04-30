class Book < ApplicationRecord

  # UserモデルとN対1の関係にある（複数の本が、1人のユーザーと紐づいている）
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true, length: { maximum:200 }

end
