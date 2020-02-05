class GenerateSectionPermalinks < ActiveRecord::Migration[5.1]
  def up
    Section.all.each do |section|
      permalink = '/' + section.slug
      if !section.parent_id.nil?
        permalink = '/' + Section.find(section.parent_id).slug + permalink
      end
      section.update_attributes :permalink => permalink
    end
  end
end
