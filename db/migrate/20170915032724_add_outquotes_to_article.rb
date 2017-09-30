class AddOutquotesToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :outquotes, :string, array: true, default: []
  end
end
