class Article < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :summary, :content]
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :section, optional: true

  has_many :authorships
  has_many :contributors,
           through: :authorships,
           dependent: :destroy,
           source: :user

  has_many :media, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :outquotes, dependent: :destroy

  def init
    self.update(is_published: false)
  end

  def published_comments
    self.comments.where.not(published_at: nil)
  end

  def self.order_by_rank
    Article
      .joins("LEFT JOIN sections ON articles.section_id = sections.id")
      .order("articles.rank + 3 * sections.rank + 12 * articles.issue + 192 * articles.volume DESC")
  end

   # TODO: generate cleaned/truncated content for summary if no summary provided
   
end
