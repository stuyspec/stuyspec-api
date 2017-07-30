class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :slug
      t.text :content
      t.integer :volume
      t.integer :issue
      t.boolean :is_draft
      t.timestamps
    end
  end
end
