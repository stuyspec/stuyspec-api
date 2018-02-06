class Medium < ApplicationRecord
  belongs_to :article
  belongs_to :profile
  has_one :user, through: :profile

  has_attached_file :attachment,
                    storage: :s3,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

  validates_attachment :attachment,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def attachment_url
    attachment.url
  end
  def medium_attachment_url
    attachment.url :medium
  end
  def thumb_attachment_url
    attachment.url :thumb
  end
end
