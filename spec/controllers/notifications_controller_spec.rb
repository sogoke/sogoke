require 'spec_helper'

describe NotificationsController do

  describe "GET index" do
    it "assigns all notifications as @notifications" do
      notification = Notification.create! valid_attributes
      get :index
      assigns(:notifications).should eq([notification])
    end
  end

  describe "GET show" do
    it "assigns the requested notification as @notification" do
      notification = Notification.create! valid_attributes
      get :show, :id => notification.id.to_s
      assigns(:notification).should eq(notification)
    end
  end
end
