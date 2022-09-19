class PostSerializer < ActiveModel::Serializer
  attributes :id,:title,:content
  belongs_to :employee,serializer:EmployeeSerializer
  has_many :comments, serializer:CommentSerializer
end
