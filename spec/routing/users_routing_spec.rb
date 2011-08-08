require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #inactive" do
      get("/users/inactive").should route_to("users#inactive")
    end
    
    it "routes to #show" do
      get("/users/1").should route_to(:controller => "users", :action => "show", :id => "1")
    end
  end
end
