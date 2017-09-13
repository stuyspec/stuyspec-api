class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :articles, through: :authorships
  has_many :comments
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_attached_file :profile,
                    storage: :s3,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment :profile,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def profile_url
    profile.url
  end
  def medium_profile_url
    profile.url :medium
  end
  def thumb_profile_url
    profile.url :thumb
  end
end
