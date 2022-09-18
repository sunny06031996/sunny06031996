class PostsSerializer < ActiveModel::Serializer
  attributes :id,:content,:title
  has_many :comments, serializer: CommentsSerializer
end
