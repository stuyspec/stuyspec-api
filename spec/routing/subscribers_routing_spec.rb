require "rails_helper"

RSpec.describe SubscribersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subscribers").to route_to("subscribers#index")
    end


    it "routes to #show" do
      expect(:get => "/subscribers/1").to route_to("subscribers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/subscribers").to route_to("subscribers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subscribers/1").to route_to("subscribers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subscribers/1").to route_to("subscribers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subscribers/1").to route_to("subscribers#destroy", :id => "1")
    end

  end
end
