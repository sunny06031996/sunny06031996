class AddCommentableToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :commentable, polymorphic: true, null: false
  end
end
