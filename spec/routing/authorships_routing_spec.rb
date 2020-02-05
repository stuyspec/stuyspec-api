require "rails_helper"

RSpec.describe AuthorshipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/authorships").to route_to("authorships#index")
    end


    it "routes to #show" do
      expect(:get => "/authorships/1").to route_to("authorships#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/authorships").to route_to("authorships#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/authorships/1").to route_to("authorships#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/authorships/1").to route_to("authorships#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/authorships/1").to route_to("authorships#destroy", :id => "1")
    end

  end
end
