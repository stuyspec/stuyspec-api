require 'rails_helper'

RSpec.describe "Replies", type: :request do
  describe "GET /replies" do
    it "works! (now write some real specs)" do
      get replies_path
      expect(response).to have_http_status(200)
    end
  end
end
