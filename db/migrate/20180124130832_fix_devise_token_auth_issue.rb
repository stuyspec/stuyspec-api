# https://github.com/lynndylanhurley/devise_token_auth/issues/121

class FixDeviseTokenAuthIssue < ActiveRecord::Migration[5.1]
  def change
    User.find_each do |user|
      user.uid = user.email
      user.tokens = nil
      user.save!
    end
  end
end
