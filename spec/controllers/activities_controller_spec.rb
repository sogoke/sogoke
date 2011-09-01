require 'spec_helper'

describe ActivitiesController do
  describle "GET 'index'" do
    it "display user activities"
  end
  
  describe "GET show" do
    it "assigns the requested activity as @activity" do
      activity = Activity.create! valid_attributes
      get :show, :id => activity.id.to_s
      assigns(:activity).should eq(activity)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      activity = Activity.create! valid_attributes
      expect {
        delete :destroy, :id => activity.id.to_s
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = Activity.create! valid_attributes
      delete :destroy, :id => activity.id.to_s
      response.should redirect_to(activities_url)
    end
  end

end
