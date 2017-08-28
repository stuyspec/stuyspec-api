class AddRank < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :rank, :integer, :default => 1
    add_column :sections, :rank, :integer, :default => 1
  end
end
