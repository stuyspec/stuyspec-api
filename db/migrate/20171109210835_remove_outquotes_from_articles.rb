class RemoveOutquotesFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :outquotes, :string, array: true
  end
end
