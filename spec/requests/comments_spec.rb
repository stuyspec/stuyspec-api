require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before(:all) do
    unless @user = User.where(email: "jkao1@stuy.edu").first
      @user = User.create(
        email: "jkao1@stuy.edu",
        password: "hunter2hunter2",
        password_confirmation: "hunter2hunter2"
      )
    end
    @article = Article.first
  end
  
  describe "POST /comments" do
    it 'correctly creates a new article' do
      auth_token = @user.create_new_auth_token
      post(comments_path,
           params: {
             comment: {
               article_id: @article.id,
               content: "This is my comment"
             }
           },
           headers: auth_token
          )
    end
  end
  describe "GET /comments" do
    it 'returns correct types' do
      get comments_path, params: { limit: 10 }
      expect_json_types(
        '?',
        content: :string,
        user_id: :integer,
        article_id: :integer
      )
    end
  end

end
