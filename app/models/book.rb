class Book < ApplicationRecord
  
  # UserモデルとN対1の関係にある（複数の本が、1人のユーザーと紐づいている）
  belong_to :user
end
