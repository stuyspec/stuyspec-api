require 'rails_helper'

RSpec.describe "UserRoles", type: :request do
  describe "GET /user_roles" do
    it "works! (now write some real specs)" do
      get user_roles_path
      expect(response).to have_http_status(200)
    end
  end
end
