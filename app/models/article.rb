class Article < ApplicationRecord

  before_create :init

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

  def self.order_by_rank
    Article
      .joins(:section)
      .order("articles.rank + 3 * sections.rank + 12 * articles.issue + 192 * articles.volume DESC")
  end

  def init
    self.preview = self.generate_preview()
  end

  def generate_preview
    preview = self.summary

    if preview.nil? || preview.empty?
      if self.content.nil? || self.content.empty?
        return nil
      end
      # This global replace before HTML tag sanitizing ensures we have spaces
      # between paragraphs.
      clean_content = self.content.gsub('</p><p>', ' ')
      preview = ActionView::Base.full_sanitizer.sanitize(clean_content)
        .split(' ')[0, 25]
        .join(' ') + '...'
    else
      words = preview.split(' ')
      if words.length > 25
        preview = words[0, 25].join(' ') + '...'
      end
    end

    return preview
  end
   
end
