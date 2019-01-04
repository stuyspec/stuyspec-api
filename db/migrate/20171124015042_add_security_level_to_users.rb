class AddSecurityLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :security_level, :integer, :default => 0
  end
end
