require "spec_helper"

describe SettingsController do
  describe "routing" do

    it "routes to #base" do
      get("/users/settings/base").should route_to("settings#base")
    end
    
    it "routes to #binding" do
      get("/users/settings/binding").should route_to("settings#binding")
    end
  end
end
