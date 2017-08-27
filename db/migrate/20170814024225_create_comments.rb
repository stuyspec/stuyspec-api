class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :article_id
      t.string :integer
      t.string :comment_id
      t.string :integer
      t.string :user_id
      t.string :integer
      t.text :content

      t.timestamps
    end
  end
end
