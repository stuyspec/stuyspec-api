class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.belongs_to :user_id
      t.belongs_to :article_id
      t.string :url
      t.string :title
      t.text :caption
      t.boolean :is_featured
      t.string :type

      t.timestamps
    end
  end
end
