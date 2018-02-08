class GenerateMissingUserSlugs < ActiveRecord::Migration[5.1]
  def up
    User.all.each do |user|
      if user.slug.nil? and not (user.first_name.nil? or user.last_name.nil?)
        user.update_attributes :slug => (user.first_name + user.last_name).parameterize
      end
    end
  end
end