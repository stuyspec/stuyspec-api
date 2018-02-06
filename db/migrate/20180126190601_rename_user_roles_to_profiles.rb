class RenameUserRolesToProfiles < ActiveRecord::Migration[5.1]
  def change
    rename_table "user_roles", "profiles"
  end
end
