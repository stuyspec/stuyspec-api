class Medium < ApplicationRecord
  belongs_to :article
  belongs_to :user

  has_attached_file :attachment
  validates_attachment :attachment,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
