class RemoveIsFeaturedFromMedia < ActiveRecord::Migration[5.1]
  def change
    Medium.where(is_featured: true).each do |medium|
      article = medium.article
      article.featured_media = medium
      article.save
    end
    remove_column :media, :is_featured
  end
end
