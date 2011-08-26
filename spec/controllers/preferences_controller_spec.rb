require 'spec_helper'

describe PreferencesController do

  describe "GET edit" do
    login_user
    it "assigns the requested preference as @preference" do
      get :edit
      response.should render_template(:edit)
    end
  end

  describe "PUT update" do
    login_user
    let(:current_user) { mock_model(User) }
    let(:preference) { mock_model(Preference, update_attributes: true, id: 5) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub!(:preference).and_return(preference)
    end
    
    describe "with valid params" do
      it "updates the requested preference" do
        preference.should_receive(:update_attributes).with({'these' => 'params'}).and_return(true)
        put :update, :id => preference.id, :preference => {'these' => 'params'}
        
        response.should redirect_to(edit_preference_path)
      end
    end

    describe "with invalid params" do
      it "assigns the preference as @preference" do
        preference.stub(:update_attributes).and_return(false)
        
        put :update, :id => preference.id, :preference => {}
        
        response.should render_template("edit")
      end
    end
  end
  
end
