require "rails_helper"

RSpec.describe NewspapersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/newspapers").to route_to("newspapers#index")
    end


    it "routes to #show" do
      expect(:get => "/newspapers/1").to route_to("newspapers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/newspapers").to route_to("newspapers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/newspapers/1").to route_to("newspapers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/newspapers/1").to route_to("newspapers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/newspapers/1").to route_to("newspapers#destroy", :id => "1")
    end

  end
end
