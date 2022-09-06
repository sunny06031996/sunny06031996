class Employee < ApplicationRecord
   enum role: {HR: 0, TL: 1,Manager:2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

  has_many :posts
  has_many :comments, through: :posts, dependent: :destroy
  has_many :likes, through: :posts, dependent: :destroy
  has_one_attached  :image

end
