require 'rails_helper'

RSpec.describe "Outquotes", type: :request do
  describe "GET /outquotes" do
    it "works! (now write some real specs)" do
      get outquotes_path
      expect(response).to have_http_status(200)
    end
  end
end
