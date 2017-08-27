class RemoveCommentIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :comment_id
  end
end
