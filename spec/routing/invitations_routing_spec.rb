require "spec_helper"

describe InvitationsController do
  describe "routing" do

    it "routes to #new" do
      get("/invitations/new").should route_to("invitations#new")
    end

    it "routes to #show" do
      get("/invitations/1").should route_to("invitations#show", :id => "1")
    end

    it "routes to #create" do
      post("/invitations").should route_to("invitations#create")
    end

    it "routes to #send_invitations_to_friends" do
      post("/send_invitations_to_friends").should route_to("invitations#send_invitations_to_friends")
    end
  end
end
