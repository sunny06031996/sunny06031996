class Post < ApplicationRecord
	belongs_to :employee,optional: true	
	has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :likes, as: :likeable
end
