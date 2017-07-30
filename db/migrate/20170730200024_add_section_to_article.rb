class AddSectionToArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :section, foreign_key: true
  end
end
