class GenerateArticlePreviews < ActiveRecord::Migration[5.1]
  def up
    Article.all.each do |article|
      if article.summary.to_s.empty?
        preview = article.content.split(' ')[0, 25].join(' ') + '...'
      else
        words = article.summary.split(' ')
        if words.length > 25
          preview = words[0, 25].join(' ') + '...'
        else
          preview = article.summary
        end
      end

      # Replacing </p><p> is separate from the regex sub so we don't get two
      # spaces in a row.
      article.update_attributes :preview => preview.gsub('</p><p>', ' ').gsub(/<\/?[^>]*>/, " ")
    end      
  end
end