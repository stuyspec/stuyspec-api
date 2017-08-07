class AddThumbnailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :thumbnail, :string
  end
end
