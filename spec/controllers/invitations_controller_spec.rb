require 'spec_helper'

describe InvitationsController do
  
  describe "GET 'new'" do
    let(:invitation) { mock_model(Invitation) }
    
    before(:each) do
      Invitation.stub!(:new).and_return(invitation)
    end
    
    it "Invitation should receive new" do
      Invitation.should_receive(:new).and_return(invitation)
      get :new
    end
    
    it "@invitation should be the same as invitation" do
      get :new
      assigns(:invitation).should eq(invitation)
    end
    
    it "renders new html" do
      get :new
      response.should render_template("new")
    end
  end
end
