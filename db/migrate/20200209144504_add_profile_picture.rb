class AddProfilePicture < ActiveRecord::Migration[5.1]
    def self.up
        add_attachment :users, :profile_picture
    end

    def self.down
        remove_attachment :users, :profile_picture
    end
end
