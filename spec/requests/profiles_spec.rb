require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /profiles" do
    it "has the right types" do
      get profiles_path, params: { limit: 10 }
      expect(response).to have_http_status(200)
    end
  end
end
