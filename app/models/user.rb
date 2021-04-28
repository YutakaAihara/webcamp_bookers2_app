class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # bookモデルと1対N（ユーザー1人に対して複数の本が紐づいている。）dependent: :destroyで、ユーザーが消えたら紐づいた本も消える
  has_many :books, dependent: :destroy


end
