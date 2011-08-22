
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
  
  describe "POST 'create'" do
    let(:invitation) { mock_model(Invitation) }
    
    before(:each) do
      Invitation.stub!(:new).and_return(invitation)
      invitation.stub!(:save).and_return(true)
    end
    
    def do_post
      post :create, :invitation => {:name => "alice", :email => "fake@gmail.com"}
    end
    
    it "generates a new invitation from params" do
      Invitation.should_receive(:new).once.with("name" => "alice", "email" => "fake@gmail.com").and_return(invitation)
      do_post
    end
    
    it "save returns true, render successful" do
      invitation.should_receive(:save).and_return(true)
      do_post
      response.should render_template(:successful)
    end
    
    it "save returns false, render new" do
      invitation.stub!(:save).and_return(false)
      invitation.should_receive(:save).and_return(false)
      do_post
      response.should render_template(:new)
    end
  end
  
  describe "GET 'show'" do
    def do_get
      get :show, id: "1"
    end
    
    it "redirects to register path" do
      Invitation.stub!(:exists?).and_return(true)
      Invitation.should_receive(:exists?).with(conditions: {id: "1"}).and_return(true)
      do_get
      response.should redirect_to(new_user_registration_path)
    end
    
    it "renders show html if invitation is invalid" do
      Invitation.stub(:exists?).and_return(false)
      do_get
      response.should render_template(:show)
    end
  end
  
  describe "GET 'friends'" do
    it "render send invitations to friends" do
      get :friends
      response.should render_template(:friends)
    end    
  end
  
  describe "POST 'send_invitations_to_friends'" do
    let(:current_user) { mock_model(User) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      Invitation.stub!(:send_invitations_to_friends)
    end
    
    it "sends emails to friends" do
      Invitation.should_receive(:send_invitations_to_friends).with(current_user, "Welcome to SOGOKE", "nihilism.z@gmail.com")
      post :friends, words_from_friend: "Welcome to SOGOKE", friends_mails: "nihilism.z@gmail.com"
      response.should redirect_to(root_path)
    end
  end
end
