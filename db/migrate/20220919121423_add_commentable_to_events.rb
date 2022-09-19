class AddCommentableToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :commentable, polymorphic: true, null: false
  end
end
