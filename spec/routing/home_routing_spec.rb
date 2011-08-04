require "spec_helper"

describe HomeController do
  describe "routing" do

    it "routes to root" do
      get("/").should route_to("home#index")
    end
  end
end
