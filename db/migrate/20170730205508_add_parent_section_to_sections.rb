class AddParentSectionToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :parent_section, :integer
  end
end
