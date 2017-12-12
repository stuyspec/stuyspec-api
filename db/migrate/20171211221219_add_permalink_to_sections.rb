class AddPermalinkToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :permalink, :string
  end
end
