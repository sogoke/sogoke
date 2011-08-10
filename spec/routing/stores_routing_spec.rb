require "spec_helper"

describe StoresController do
  describe "routing" do

    it "routes to #show" do
      get("/stores/1").should route_to("stores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stores/1/edit").should route_to("stores#edit", :id => "1")
    end

    it "routes to #update" do
      put("/stores/1").should route_to("stores#update", :id => "1")
    end
  end
end
