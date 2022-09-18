class Event < ApplicationRecord
	belongs_to :employee,optional: true
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
    has_many :likes, as: :likeable	
end
