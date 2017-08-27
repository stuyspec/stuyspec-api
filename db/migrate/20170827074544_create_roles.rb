class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.text :title
      t.text :slug

      t.timestamps
    end
  end
end
