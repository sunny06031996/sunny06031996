class CommentSerializer < ActiveModel::Serializer
   attributes :id,:title:content
   belongs_to :post
   belong_to :employee
end
