class Section < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :articles, dependent: :destroy
  belongs_to :parent_section,
             class_name: 'Section',
             foreign_key: "parent_id",
             dependent: :destroy,
             optional: true
  has_many :subsections, class_name: 'Section', foreign_key: "parent_id"
end
