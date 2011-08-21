require 'spec_helper'

describe PreferencesController do

  describe "GET edit" do
    it "assigns the requested preference as @preference" do
      preference = Preference.create! valid_attributes
      get :edit, :id => preference.id.to_s
      assigns(:preference).should eq(preference)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested preference" do
        preference = Preference.create! valid_attributes
        Preference.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => preference.id, :preference => {'these' => 'params'}
      end

      it "assigns the requested preference as @preference" do
        preference = Preference.create! valid_attributes
        put :update, :id => preference.id, :preference => valid_attributes
        assigns(:preference).should eq(preference)
      end

      it "redirects to the preference" do
        preference = Preference.create! valid_attributes
        put :update, :id => preference.id, :preference => valid_attributes
        response.should redirect_to(preference)
      end
    end

    describe "with invalid params" do
      it "assigns the preference as @preference" do
        preference = Preference.create! valid_attributes
        Preference.any_instance.stub(:save).and_return(false)
        put :update, :id => preference.id.to_s, :preference => {}
        assigns(:preference).should eq(preference)
      end

      it "re-renders the 'edit' template" do
        preference = Preference.create! valid_attributes
        Preference.any_instance.stub(:save).and_return(false)
        put :update, :id => preference.id.to_s, :preference => {}
        response.should render_template("edit")
      end
    end
  end
  
end
