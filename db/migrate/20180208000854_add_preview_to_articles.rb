class AddPreviewToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :preview, :string
  end
end
