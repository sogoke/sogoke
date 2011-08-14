require "spec_helper"

describe CommentsController do
  describe "routing" do
    it "routes to #create" do
      post("/articles/1/comments").should route_to("comments#create", :article_id => "1")
    end

    it "routes to #destroy" do
      delete("/articles/1/comments/2").should route_to("comments#destroy", :article_id => "1", :id => "2")
    end

    it "routes to #create" do
      post("/products/1/comments").should route_to("comments#create", :product_id => "1")
    end

    it "routes to #destroy" do
      delete("/products/1/comments/2").should route_to("comments#destroy", :product_id => "1", :id => "2")
    end
  end
end
