require 'rails_helper'

RSpec.describe "Subscribers", type: :request do
  describe "GET /subscribers" do
    it "works! (now write some real specs)" do
      get subscribers_path
      expect(response).to have_http_status(200)
    end
  end
end
