class Article < ApplicationRecord

  include PgSearch
  multisearchable :against => [:title, :summary, :content]

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Sets how many articles are shown per page; this is aprt of the kaminari
  # gem's pagination config.
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

    # Removes all HTML tags. We replace </p><p> separately so there are never
    # two spaces in a row.
    self.update(preview, preview.gsub('</p><p>', ' ').gsub(/<\/?[^>]*>/, ' '))
  end

  def self.order_by_rank
    Article
      .joins(:section)
      .order("articles.rank + 3 * sections.rank + 12 * articles.issue + 192 * articles.volume DESC")
  end
   
end
