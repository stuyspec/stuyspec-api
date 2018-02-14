class GenerateArticlePreviews < ActiveRecord::Migration[5.1]
  def up
    Article.all.each do |article|
      if article.summary.nil? || article.summary.empty?
        preview = article.content.split(' ')[0, 25].join(' ') + '...'
      else
        words = article.summary.split(' ')
        if words.length > 25
          preview = words[0, 25].join(' ') + '...'
        else
          preview = article.summary
        end
      end

      preview = ActionView::Base.full_sanitizer.sanitize(preview)
      article.update(preview: preview)
    end
  end
end