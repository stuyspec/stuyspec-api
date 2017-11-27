require "rails_helper"

RSpec.describe ArticleTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/article_tags").to route_to("article_tags#index")
    end


    it "routes to #show" do
      expect(:get => "/article_tags/1").to route_to("article_tags#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/article_tags").to route_to("article_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/article_tags/1").to route_to("article_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/article_tags/1").to route_to("article_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/article_tags/1").to route_to("article_tags#destroy", :id => "1")
    end

  end
end
