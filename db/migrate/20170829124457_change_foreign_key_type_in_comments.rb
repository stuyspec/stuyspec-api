class ChangeForeignKeyTypeInComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :article_id, 'integer USING CAST(article_id AS integer)'
    change_column :comments, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
