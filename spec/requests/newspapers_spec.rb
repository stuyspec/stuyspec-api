require 'rails_helper'

RSpec.describe "Newspapers", type: :request do
  describe "GET /newspapers" do
    it "works! (now write some real specs)" do
      get newspapers_path
      expect(response).to have_http_status(200)
    end
  end
end
