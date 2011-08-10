require 'spec_helper'

describe UsersController do
  describe "User 'inactive'" do
    it "render inactive" do
      get :inactive
      response.should render_template(:inactive)
    end
  end
  
  describe "User 'show'" do
    pending "render show"
  end
end
