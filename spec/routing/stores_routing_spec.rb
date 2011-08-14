require "spec_helper"

describe StoresController do
  describe "routing" do

    it "routes to #show" do
      get("/stores/1").should route_to("stores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/users/store/edit").should route_to("stores#edit")
    end

    it "routes to #update" do
      put("/users/store").should route_to("stores#update")
    end
  end
end
