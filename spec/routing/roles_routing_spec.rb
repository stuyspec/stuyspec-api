require "rails_helper"

RSpec.describe RolesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/roles").to route_to("roles#index")
    end


    it "routes to #show" do
      expect(:get => "/roles/1").to route_to("roles#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/roles").to route_to("roles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/roles/1").to route_to("roles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/roles/1").to route_to("roles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/roles/1").to route_to("roles#destroy", :id => "1")
    end

  end
end
