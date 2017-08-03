class Section < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :articles
  belongs_to :parent_section, class_name: 'Section', optional: true
  has_many :subsections, class_name: 'Section', foreign_key: "parent_section"
end
