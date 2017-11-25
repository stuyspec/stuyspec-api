class CreateNewspapers < ActiveRecord::Migration[5.1]
  def change
    create_table :newspapers do |t|
      t.integer :volume
      t.integer :issue
      t.integer :issue_config

      t.timestamps
    end
  end
end
