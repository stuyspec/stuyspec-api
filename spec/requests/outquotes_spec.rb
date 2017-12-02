require 'rails_helper'

RSpec.describe "Outquotes", type: :request do
  describe "GET /outquotes" do
    it "works! (now write some real specs)" do
      get outquotes_path, params: { limit: 10 }
      expect_json_types(
        '?',
        text: :string,
        article_id: :integer
      )
    end
  end
end
