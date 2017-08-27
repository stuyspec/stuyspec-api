class AddSlugToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slug, :string
  end
end
