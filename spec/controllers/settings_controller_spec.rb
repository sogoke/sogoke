require 'spec_helper'

describe SettingsController do

  describe "GET 'base'" do
    login_user
    it "should be successful" do
      get 'base'
      response.should render_template("base")
    end
  end
  
  describe "Put 'base'" do   
    login_user
    let(:current_user) { mock_model(User) }
    let(:preference) { mock_model(Preference, update_attributes: true) }
     
    before(:each) do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:preference).and_return(preference)
    end
    
    it "should receive update_attributes" do
      preference.should_receive(:update_attributes).with({"gender" => "male"}).and_return(true)
      
      put :base, :preference => {"gender" => "male"}
      
      flash[:notice].should eq(I18n.t("setting.base.successful"))
      
      response.should render_template(:base)
    end
    
    it "updates with wrong parameters" do
      preference.stub(:update_attributes).and_return(false)
      
      put :base, :preference => {"gender" => "male"}
      
      flash[:notice].should eq(nil)
      
      response.should render_template(:base)
    end
  end

  describe "GET 'binding'" do
    login_user
    it "should be successful" do
      get 'binding'
      response.should render_template("binding")
    end
  end
end
