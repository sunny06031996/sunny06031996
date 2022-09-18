class CommentsSerializer < ActiveModel::Serializer
   attributes :id, :content, :post_id, :employee_id
end
