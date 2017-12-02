require 'rails_helper'

RSpec.describe "UserRoles", type: :request do
  describe "GET /user_roles" do
    it "has the right types" do
      get user_roles_path, params: { limit: 10 }
      expect(response).to have_http_status(200)
    end
  end
end
