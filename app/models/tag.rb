class Tag < ApplicationRecord
  has_and_belongs_to_many :articles, :join_table => :article_tags, :class_name => "ArticleTag"
end
