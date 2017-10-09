require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "returns correct types" do
      get articles_path
      expect_json_types(
        '*',
        title: :string,
        slug: :string,
        content: :string
      )
    end
  end

  describe "POST /articles" do
    it "creates new article" do
      post articles_path,
           params: {
             article: {
               title: 'My article',
               content: 'This is my article',
               volume: 1,
               issue: 2,
               is_published: false,
             },
             section_id: 1
           }
    end
  end
end
