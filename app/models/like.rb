class Like < ApplicationRecord
	belongs_to :employee, optional: true
    belongs_to :likeable, polymorphic: true
end
