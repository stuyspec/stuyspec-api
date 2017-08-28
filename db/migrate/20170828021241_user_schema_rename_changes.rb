class UserSchemaRenameChanges < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :nickname, :username
  end
end
