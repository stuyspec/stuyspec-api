class GenerateArticlePreviews < ActiveRecord::Migration[5.1]
  def up
    Article.reset_column_information
    Article.all.each do |article|
      article.update(preview: article.generate_preview)
    end
  end
end