class RemoveIssueAndVolumeFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :volume
    remove_column :articles, :issue
  end
end
