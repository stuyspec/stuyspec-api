class AddColumnToUserrole < ActiveRecord::Migration[5.1]
  def change
    add_column :userroles, :user_id, :integer
    add_column :userroles, :role_id, :integer
  end
end
