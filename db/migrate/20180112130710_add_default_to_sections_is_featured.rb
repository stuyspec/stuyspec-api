class AddDefaultToSectionsIsFeatured < ActiveRecord::Migration[5.1]
  def self.up
    change_column :sections, :is_featured, :boolean, :default => false, :null => false
  end
end