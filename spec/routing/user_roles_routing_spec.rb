require "rails_helper"

RSpec.describe UserRolesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_roles").to route_to("user_roles#index")
    end


    it "routes to #show" do
      expect(:get => "/user_roles/1").to route_to("user_roles#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_roles").to route_to("user_roles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_roles/1").to route_to("user_roles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_roles/1").to route_to("user_roles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_roles/1").to route_to("user_roles#destroy", :id => "1")
    end

  end
end
