class PostsSerializer < ApplicationSerializer
  attributes :id,:content,:title
  has_many :comments, serializer: CommentsSerializer
end
