class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # bookモデルと1対N（ユーザー1人に対して複数の本が紐づいている。）dependent: :destroyで、ユーザーが消えたら紐づいた本も消える
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: active_relationships, source: :followed

  attachment :profile_image

  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  
  def follow(other_user)
    following << other_user
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?
    following.include?(other_user)
end
