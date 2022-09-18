class EventsSerializer < ActiveModel::Serializer
   attributes :id,:name,:employee
   has_many :comments, serializer: CommentsSerializer
end
