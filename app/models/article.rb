class Article < ApplicationRecord

  include PgSearch
  multisearchable :against => [:title, :summary, :content]

  extend FriendlyId
  friendly_id :title, use: :slugged

  paginates_per 10

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

    if self.summary.to_s.empty?
        preview = self.content.split(' ')[0, 25].join(' ') + '...'
    else
      words = self.summary.split(' ')
      if words.length > 25
        preview = words[0, 25].join(' ') + '...'
      else
        preview = self.summary
      end
    end

    # Replacing </p><p> is separate from the regex sub so we don't get two
    # spaces in a row.
    self.update(preview, preview.gsub('</p><p>', ' ').gsub(/<\/?[^>]*>/, ' '))
  end

  def self.order_by_rank
    Article
      .joins(:section)
      .order("articles.rank + 3 * sections.rank + 12 * articles.issue + 192 * articles.volume DESC")
  end

   # TODO: generate cleaned/truncated content for summary if no summary provided
   
end
