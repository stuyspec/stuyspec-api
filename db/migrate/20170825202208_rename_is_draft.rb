class RenameIsDraft < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :is_draft, :is_published
  end
end
