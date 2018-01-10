class SetSectionsIsFeatured < ActiveRecord::Migration[5.1]
  def up
    Section.all.each do |section|
      is_featured = section.parent_id.nil?
      section.update_attributes :is_featured => is_featured
    end
  end
end
