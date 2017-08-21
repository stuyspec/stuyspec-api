class CreateUserroles < ActiveRecord::Migration[5.1]
  def change
    create_table :userroles do |t|

      t.timestamps
    end
  end
end
