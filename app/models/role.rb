class Role < ApplicationRecord
  has_many :profiles
  has_many :users, through: :profiles
end
