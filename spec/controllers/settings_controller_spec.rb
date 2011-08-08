require 'spec_helper'

describe SettingsController do

  describe "GET 'base'" do
    it "should be successful" do
      get 'base'
      response.should render_template("base")
    end
  end
  
  describe "Put 'base'" do    
    before(:each) do
      controller.stub!(:current_user).and_return(mock_model(User, :update_attributes => true))
    end
    
    it "should receive update_attributes" do
      controller.current_user.should_receive(:update_attributes).with({"gender" => "male"}).and_return(true)
      
      put :base, :users => {"gender" => "male"}
      
      flash[:notice].should eq(I18n.t("settings.base.successful"))
      
      response.should render_template(:base)
    end
    
    it "updates with wrong parameters" do
      controller.stub!(:current_user).and_return(mock_model(User, :update_attributes => false))
      
      controller.current_user.should_receive(:update_attributes).with({"gender" => "male"}).and_return(false)
      
      put :base, :users => {"gender" => "male"}
      
      flash[:notice].should eq(nil)
      
      response.should render_template(:base)
    end
  end

  describe "GET 'notification'" do
    it "should be successful" do
      get 'notification'
      response.should render_template("notification")
    end
  end

  describe "GET 'binding'" do
    it "should be successful" do
      get 'binding'
      response.should render_template("binding")
    end
  end

  describe "GET 'store'" do
    it "should be successful" do
      get 'store'
      response.should render_template("store")
    end
  end

end
