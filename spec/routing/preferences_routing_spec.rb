require "spec_helper"

describe PreferencesController do
  describe "routing" do

    it "routes to #edit" do
      get("/preference/edit").should route_to("preferences#edit")
    end

    it "routes to #update" do
      put("/preference").should route_to("preferences#update")
    end
  end
end
