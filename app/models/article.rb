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
end
