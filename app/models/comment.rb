class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  def is_author?(user)
    user.id == self.user_id
  end

  def publish
    self.touch(:published_at)
  end
end
