class AddFeaturedMediaToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :featured_media, :bigint
  end
end
