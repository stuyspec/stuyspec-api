class ChangeMediaUserIdToProfileId < ActiveRecord::Migration[5.1]
  def change
    rename_column :media, :user_id, :profile_id
  end
end
