class Comment < ApplicationRecord
    belongs_to :employee
    belongs_to :commentable, polymorphic: true
    has_many :likes, dependent: :destroy, as: :likeable
end
