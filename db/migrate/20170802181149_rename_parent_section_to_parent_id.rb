class RenameParentSectionToParentId < ActiveRecord::Migration[5.1]
  def change
    rename_column :sections, :parent_section, :parent_id
  end
end
