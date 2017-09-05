class AddNewspaperToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :newspaper_id, :integer
  end
end
