class AddIsVisibleToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :is_visible, :boolean
  end
end
