class ChangeArticlesSlug < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :slug, :string, unique: true
  end
end
