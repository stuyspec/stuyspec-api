class CreateOutquotes < ActiveRecord::Migration[5.1]
  def change
    create_table :outquotes do |t|
      t.integer :article_id
      t.text :text

      t.timestamps
    end
  end
end
