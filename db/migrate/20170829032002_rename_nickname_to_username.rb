class RenameNicknameToUsername < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :nickname, :username
  end
end

