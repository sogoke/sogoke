require 'spec_helper'

describe UsersController do
  describe "User 'inactive'" do
    it "render inactive" do
      get :inactive
      response.should render_template(:inactive)
    end
  end
  
  describe "User 'show'" do
    it "render show" do
      get :show, :id => 1
      response.should render_template(:show)
    end
  end
end
