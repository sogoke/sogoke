require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #inactive" do
      get("/users/inactive").should route_to("users#inactive")
    end
  end
end
