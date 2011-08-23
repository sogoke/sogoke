require "spec_helper"

describe FavoritesController do
  describe "routing" do

    it "routes to #create" do
      post("/favorites").should route_to("favorites#create")
    end

    it "routes to #destroy" do
      delete("/favorites/1").should route_to("favorites#destroy", :id => "1")
    end

    it "routes to #products" do
      get("/users/1/favorites/products").should route_to("favorites#products", :user_id => "1")
    end

    it "routes to #articles" do
      get("/users/1/favorites/articles").should route_to("favorites#articles", :user_id => "1")
    end
    
    it "routes to #stores" do
      get("/users/1/favorites/stores").should route_to("favorites#stores", :user_id => "1")
    end
  end
end
