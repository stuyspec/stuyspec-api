class CreateArticleIdInSection < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :article_id, :bigInt, array: true, default: []
  end
end
