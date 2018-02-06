class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :role, dependent: :destroy
  has_many :media
end
