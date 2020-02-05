class ChangeMediaUserIdToProfileId < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :profile_id, :bigint
    media_type_to_role = {
      "photo" => "Photographer",
      "illustration" => "Illustrator",
    }
    Medium.transaction do
      Medium.find_each do |medium|
        title = media_type_to_role[medium.media_type]
        throw "No title for given media type: #{medium.media_type}" if title.nil?
        profile = Profile
                    .joins(:role, :user)
                    .find_by(
                      "roles.title = ? AND users.id = ?",
                      title,
                      medium.user_id)
        if profile.nil?
          role = Role.find_by(title: title)
          profile = Profile.create(user_id: medium.user_id, role_id: role.id)
        end
        medium.update(profile_id: profile.id)
      end
      remove_column :media, :user_id
    end
  end
end
