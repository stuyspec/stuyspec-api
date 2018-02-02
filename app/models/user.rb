class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :confirmable
  include DeviseTokenAuth::Concerns::User
  has_many :authorships
  has_many :articles, through: :authorships, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :media
  after_create :init

  def init
    self.update(security_level: 0)
  end

  def is_admin?(token, client_id)
    self.valid_token?(token, client_id) && self.security_level > 0
  end
end
