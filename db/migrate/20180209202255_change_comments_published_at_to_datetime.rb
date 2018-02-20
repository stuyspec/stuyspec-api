class ChangeCommentsPublishedAtToDatetime < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :published_at, "timestamp without time zone USING CAST(published_at AS timestamp without time zone)"
  end
end
