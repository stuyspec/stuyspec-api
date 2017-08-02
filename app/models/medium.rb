class Medium < ApplicationRecord
  belongs_to :article, :user
end
