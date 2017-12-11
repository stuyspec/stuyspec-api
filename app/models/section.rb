class Section < ApplicationRecord
  before_create :add_permalink
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :articles, dependent: :destroy
  belongs_to :parent_section,
             class_name: 'Section',
             foreign_key: "parent_id",
             dependent: :destroy,
             optional: true
  has_many :subsections, class_name: 'Section', foreign_key: "parent_id"

  def add_permalink
    permalink = "/" + self.slug
    parent_tracker = self.parent_section
    while (!parent_tracker.nil?)
      permalink = "/" + parent_tracker.slug + permalink
      parent_tracker = parent_tracker.parent_section
    end
    self.permalink = permalink
  end
end
