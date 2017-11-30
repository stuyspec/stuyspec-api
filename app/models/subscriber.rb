class Subscriber < ApplicationRecord
  validates :email, uniqueness: true
end
