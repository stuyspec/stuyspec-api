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

  has_one :featured_media, class_name: "Medium"
  has_many :media, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :outquotes, dependent: :destroy

  def init
    self.update(is_published: false)
  end
end
