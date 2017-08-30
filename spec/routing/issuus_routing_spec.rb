require "rails_helper"

RSpec.describe IssuusController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/issuus").to route_to("issuus#index")
    end


    it "routes to #show" do
      expect(:get => "/issuus/1").to route_to("issuus#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/issuus").to route_to("issuus#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/issuus/1").to route_to("issuus#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/issuus/1").to route_to("issuus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/issuus/1").to route_to("issuus#destroy", :id => "1")
    end

  end
end
