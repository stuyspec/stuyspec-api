class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :section, optional: true
  has_many :users, through: :authorships
end
