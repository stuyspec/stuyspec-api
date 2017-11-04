require 'rails_helper'

RSpec.describe "Authorships", type: :request do
  describe "GET /authorships" do
    it "works! (now write some real specs)" do
      get authorships_path
      expect(response).to have_http_status(200)
    end
  end
end
