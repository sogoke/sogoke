require 'spec_helper'

describe ActivitiesController do
  describe "GET 'index'" do
    let(:activities) { [mock_model(Activity), mock_model(Activity)] }
    
    it "display user activities" do
      User.stub_chain(:find, :activities).and_return(activities)
      get :index, :user_id => 5
      response.should render_template(:index)
    end
  end

  describe "DELETE destroy" do
    let(:current_user) { mock_model(User) }
    let(:activity) { mock_model(Activity, :destroy => true, :id => 5) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:activities, :find).and_return(activity)
    end
    
    it "redirects to the activities list" do
      delete :destroy, :id => activity.id
      response.should redirect_to(user_activities_path(current_user))
    end
  end

end
