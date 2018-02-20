class AddDefaultToArticlesIsPublished < ActiveRecord::Migration[5.1]
  def change
    change_column_default :articles, :is_published, false
  end
end
