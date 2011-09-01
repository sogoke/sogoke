require "spec_helper"

describe ActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("users/1/activities").should route_to("activities#index", :user_id => "1")
    end

    it "routes to #show" do
      get("/activities/1").should route_to("activities#show", :id => "1")
    end

    it "routes to #destroy" do
      delete("/activities/1").should route_to("activities#destroy", :id => "1")
    end

  end
end
