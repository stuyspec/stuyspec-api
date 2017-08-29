class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :section, optional: true, dependent: :destroy
  has_many :users, through: :authorships
  has_many :media
  has_many :comments
end
