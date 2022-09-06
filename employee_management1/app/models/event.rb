class Event < ApplicationRecord
	belongs_to :employee
	has_many :likes, dependent: :destroy
    has_many :likes, as: :likeable	
end
