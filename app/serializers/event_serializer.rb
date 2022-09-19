class EventSerializer < ActiveModel::Serializer
  attributes :id,:name
  belongs_to :employee,serializer:EmployeeSerializer
  has_many   :comments,serializer:CommentSerializer
end
