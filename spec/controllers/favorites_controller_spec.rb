require 'spec_helper'

describe FavoritesController do

  describe "GET 'stores'" do
    it "should be successful" do
      User.stub!(:find).and_return(mock_model(User))
      
      User.should_receive(:find).with(5)
      
      get 'stores', :user_id => 5
      
      response.should render_template(:stores)
    end
  end

  describe "GET 'products'" do
    it "should be successful" do
      User.stub!(:find).and_return(mock_model(User))
      
      User.should_receive(:find).with(5)
      
      get 'products', :user_id => 5
      
      response.should render_template(:products)
    end
  end

end