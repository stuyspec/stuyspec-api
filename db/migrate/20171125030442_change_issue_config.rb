class ChangeIssueConfig < ActiveRecord::Migration[5.1]
  def change
    rename_column :newspapers, :issue_config, :issuu_config
  end
end
