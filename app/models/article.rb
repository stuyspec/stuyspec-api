class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :section, optional: true, dependent: :destroy
  belongs_to :newspaper
  has_many :users, through: :authorships
  has_many :media
  has_many :comments
end
