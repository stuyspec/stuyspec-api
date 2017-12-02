require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before(:all) do
    @user = User.find_or_create_by(
      email: "jkao1@stuy.edu",
    )
  end
  describe "GET /articles" do
    it "returns correct types" do
      get articles_path, params: { limit: 10 }
      expect_json_types(
        '?',
        title: :string,
        slug: :string,
        content: :string
      )
    end
  end

  describe "POST /articles" do
    it "creates new article" do
      auth_token = @user.create_new_auth_token
      post(articles_path,
           params: {
             article: {
               title: 'My article',
               content: 'This is my article',
               volume: 1,
               issue: 2,
               is_published: false,
             },
             section_id: 1
           },
           headers: auth_token
          )
    end
  end

  describe "PUT /articles" do
    it "updates article" do
      auth_token = @user.create_new_auth_token
      article = Article.first
      put article_path(article),
          params: {
            article: {
              title: 'My article',
              content: 'This is my article',
              volume: 1,
              issue: 2,
              is_published: false,
            }
          },
          headers: auth_token
    end
  end

  describe "DELETE /articles" do
    it "deletes article" do
      auth_token = @user.create_new_auth_token
      article = Article.first
      delete article_path(article), headers: auth_token
    end
  end
end
