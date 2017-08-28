class AddPublishedAtToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :published_at, :string
  end
end
