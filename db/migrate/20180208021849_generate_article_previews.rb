class GenerateArticlePreviews < ActiveRecord::Migration[5.1]
  def up
    Article.all.each do |article|
      article.update(preview: article.generate_preview())
    end      
  end
end