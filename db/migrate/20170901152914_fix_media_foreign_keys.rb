class FixMediaForeignKeys < ActiveRecord::Migration[5.1]
  def change
    rename_column :media, :user_id_id, :user_id
    rename_column :media, :article_id_id, :article_id
  end
end
