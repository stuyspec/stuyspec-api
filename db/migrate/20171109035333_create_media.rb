class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :url
      t.string :title
      t.text :caption
      t.boolean :is_featured
      t.string :type

      t.timestamps
    end
  end
end
