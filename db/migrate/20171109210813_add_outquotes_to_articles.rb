class AddOutquotesToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :outquotes, :string, array: true
  end
end
