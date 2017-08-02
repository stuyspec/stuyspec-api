class CreateAuthorships < ActiveRecord::Migration[5.1]
  def change
    create_table :authorships do |t|
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
