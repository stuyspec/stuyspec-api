class CreateNewspapers < ActiveRecord::Migration[5.1]
  def change
    create_table :newspapers do |t|
      t.integer :config
      t.integer :issue
      t.integer :volume

      t.timestamps
    end
  end
end
