require 'spec_helper'

describe NotificationsController do

  describe "GET index" do
    let(:current_user) { mock_model(User) }
    let(:notifications) { [mock_model(Notification), mock_model(Notification)] }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub!(:notifications).and_return(notifications)
    end
    
    it "assigns all notifications as @notifications" do
      current_user.should_receive(:notifications).and_return(notifications)
      get :index
      assigns(:notifications).should eq(notifications)
      response.should render_template(:index)
    end
  end

  describe "GET show" do
    let(:current_user) { mock_model(User) }
    let(:notification) { mock_model(Notification, id: 5, from_path: "/hello") }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:notifications, :find).and_return(notification)
    end
    
    it "assigns the requested notification as @notification" do
      get :show, :id => notification.id
      
      response.should redirect_to(notification.from_path)
    end
  end
  
  describe "DELETE 'destroy'" do
    let(:current_user) { mock_model(User) }
    let(:notification) { mock_model(Notification, id: 5, destroy: true) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:notifications, :find).and_return(notification)
    end
    
    it "assigns the requested notification as @notification" do
      delete :destroy, :id => notification.id
      assigns(:notification).id.should eq(5)
      
      response.should redirect_to(notifications_path)
    end
  end
end
