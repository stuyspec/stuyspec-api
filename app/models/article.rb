class Article < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :summary, :content]
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :section, optional: true
  has_many :authorships
  has_many :users, through: :authorships, dependent: :destroy
  has_many :media, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :outquotes, dependent: :destroy
  has_and_belongs_to_many :tags, :join_table => :article_tags, :class_name => "ArticleTag"
end
