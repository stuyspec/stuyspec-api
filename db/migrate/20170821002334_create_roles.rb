class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.text :title
      t.text :slug

      t.timestamps
    end
  end
end
