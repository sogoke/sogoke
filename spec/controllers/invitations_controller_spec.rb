require 'spec_helper'

describe InvitationsController do
  
  describe "GET 'new'" do
    let(:invitation) { stub_model(Invitation) }
    
    before(:each) do
      Invitation.stub!(:new).and_return(invitation)
    end
    
    it "Invitation should receive new" do
      Invitation.should receive(:new).and_return(invitation)
      assigns(:invitation).should eq(invitation)
      get :new
    end
    
    it "renders index html" do
      get :new
      response.should render_template(:index)
    end
  end
end
