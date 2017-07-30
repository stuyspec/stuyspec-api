class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.text :name
      t.text :description
      t.text :slug

      t.timestamps
    end
  end
end
