class RemoveIntegerFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :integer, :string
  end
end
