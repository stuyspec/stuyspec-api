require "rails_helper"

RSpec.describe OutquotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/outquotes").to route_to("outquotes#index")
    end


    it "routes to #show" do
      expect(:get => "/outquotes/1").to route_to("outquotes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/outquotes").to route_to("outquotes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/outquotes/1").to route_to("outquotes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/outquotes/1").to route_to("outquotes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/outquotes/1").to route_to("outquotes#destroy", :id => "1")
    end

  end
end
