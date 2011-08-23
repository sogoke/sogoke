require "spec_helper"

describe RelationsController do
  describe "routing" do

    it "routes to #create" do
      post("/relations").should route_to("relations#create")
    end

    it "routes to #destroy" do
      delete("/relations/1").should route_to("relations#destroy", :id => "1")
    end

  end
end
