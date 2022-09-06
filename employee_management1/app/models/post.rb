class Post < ApplicationRecord
	belongs_to :employee
	has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :likes, as: :likeable
end
