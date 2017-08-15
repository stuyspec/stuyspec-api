class ChangeNicknameToUsername < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :nickname, :username
    add_index :users, :username, unique: true
  end
end
