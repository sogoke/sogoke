require "spec_helper"

describe BuzzsController do
  describe "routing" do
    it "routes to #show" do
      get("/buzzs/1").should route_to("buzzs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/buzzs/1/edit").should route_to("buzzs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/buzzs").should route_to("buzzs#create")
    end

    it "routes to #update" do
      put("/buzzs/1").should route_to("buzzs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/buzzs/1").should route_to("buzzs#destroy", :id => "1")
    end

  end
end
