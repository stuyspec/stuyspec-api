class ChangeMediaUserIdToProfileId < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :profile_id, :bigint
    media_type_to_role = {
      "photo" => "Photographer",
      "illustration" => "Illustrator",
    }
    Medium.find_each do |medium|
      title = media_type_to_role[medium.media_type]
      profile = Profile
                  .joins(:role, :user)
                  .find_by(
                    "roles.title = ? AND users.id = ?",
                    title,
                    medium.user_id)
      medium.update(profile_id: profile.id)
    end
    remove_column :media, :user_id
  end
end
