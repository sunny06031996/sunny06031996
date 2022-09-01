class Post < ApplicationRecord
	belongs_to :employee
	has_many :comments
end
