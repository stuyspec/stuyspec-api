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
  after_initialize :init

  def init
    self.update(is_published: false)
  end
  
  def ranking
    self.rank + 3 * self.section.rank + 18 * self.issue + 288 * self.volume
  end
end
