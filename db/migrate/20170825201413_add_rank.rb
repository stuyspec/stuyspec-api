class AddRank < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :rank, :integer
    add_column :sections, :rank, :integer
  end
end
