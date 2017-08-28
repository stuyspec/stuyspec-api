class Medium < ApplicationRecord
  belongs_to :article
  belongs_to :user

  has_attached_file :file,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment :file,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }



  def s3_credentials
    {:bucket => "stuy-spec-media" }
  end
end
