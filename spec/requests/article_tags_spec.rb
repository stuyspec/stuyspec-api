require 'rails_helper'

RSpec.describe "ArticleTags", type: :request do
  describe "GET /article_tags" do
    it "works! (now write some real specs)" do
      get article_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
