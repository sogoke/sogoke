require 'spec_helper'

describe FavoritesController do

  describe "GET 'stores'" do
    it "should be successful" do
      User.stub!(:find).and_return(mock_model(User))
      
      User.should_receive(:find).with("5")
      
      get 'stores', :user_id => 5
      
      response.should render_template(:stores)
    end
  end

  describe "GET 'products'" do
    it "should be successful" do
      User.stub!(:find).and_return(mock_model(User))
      
      User.should_receive(:find).with("5")
      
      get 'products', :user_id => 5
      
      response.should render_template(:products)
    end
  end

  describe "GET 'articles'" do
    it "should be successful" do
      User.stub!(:find).and_return(mock_model(User))
      
      User.should_receive(:find).with("5")
      
      get 'articles', :user_id => 5
      
      response.should render_template(:articles)
    end
  end
  
  describe "POST 'create'" do
    let(:current_user) { mock_model(User) }
    let(:favorite) { mock_model(FavoriteProduct, id: 5) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:favorite_products, :create).and_return(favorite)
    end
    
    describe "with valid params" do
      it "creates a new Relation" do
        current_user.should_receive(:favorite_products).once
        post :create, { favorite: { favorite_id: 3 }, token: "product" }
        response.body.should eq({ favorite_id: 5 }.to_json)
      end
    end
  end
  
  describe "DELETE 'create'" do
    let(:current_user) { mock_model(User) }
    let(:product) { mock_model(Product, id: 6) }
    let(:favorite) { mock_model(FavoriteProduct, id: 5, destroy: true, product: product) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:favorite_products, :find).and_return(favorite)
      favorite.stub!(:product).and_return(product)
    end
    
    it "destroys the requested relation" do
      favorite.should_receive(:destroy)
      delete :destroy, {:id => favorite.id, token: "product"}
      response.body.should eq({ sogoke_id: 6 }.to_json)
    end  end
end
