require 'spec_helper'
describe ProductsController do

  describe "GET index" do
    let(:products) { [ mock_model(Product), mock_model(Product) ] }
    let(:current_store) { mock_model(Store) }
    
    before do
      controller.stub!(:current_store).and_return(current_store)
      current_store.stub_chain(:products, :all).and_return(products)
    end
    
    it "assigns all products as @products" do
      get :index
      assigns(:products).should eq(products)
      response.should render_template(:index)
    end
  end

  describe "GET show" do
    let(:product) { mock_model(Product, id: 5) }
    
    it "assigns the requested product as @product" do
      Product.should_receive(:find).with("5").and_return(product)
      
      get :show, :id => product.id
      assigns(:product).should eq(product)
      assigns(:product).id.should eq(5)
      response.should render_template(:show)
    end
  end

  describe "GET new" do
    let(:product) { mock_model(Product) }
    let(:current_store) { mock_model(Store) }
    
    before do
      controller.stub!(:current_store).and_return(current_store)
      current_store.stub_chain(:products, :new).and_return(product)
    end
    
    it "assigns a new product as @product" do
      get :new
      assigns(:product).should eq(product)
      response.should render_template(product)
    end
  end

  describe "GET edit" do
    let(:product) { mock_model(Product, id: 5) }
    let(:current_store) { mock_model(Store) }
    
    before do
      controller.stub!(:current_store).and_return(current_store)
      current_store.stub_chain(:products, :find).and_return(product)
    end
    
    it "assigns the requested product as @product" do
      get :edit, :id => product.id
      assigns(:product).should eq(product)
      
      assigns(:product).id.should eq(5)
      
      response.should render_template(:edit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:product) { mock_model(Product, id: 5, save: true) }
      let(:current_store) { mock_model(Store) }

      before do
        controller.stub!(:current_store).and_return(current_store)
        current_store.stub_chain(:products, :new).and_return(product)
      end
      
      it "assigns a newly created product as @product" do
        post :create, :product => {id: 5}
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, :product => {id: 5}
        response.should redirect_to(products_path)
      end
    end

    describe "with invalid params" do
      let(:product) { mock_model(Product, id: 5, save: false) }
      let(:current_store) { mock_model(Store) }

      before do
        controller.stub!(:current_store).and_return(current_store)
        current_store.stub_chain(:products, :new).and_return(product)
      end

      it "re-renders the 'new' template" do
        post :create, :product => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:product) { mock_model(Product, id: 5, update_attributes: true) }
      let(:current_store) { mock_model(Store) }

      before do
        controller.stub!(:current_store).and_return(current_store)
        current_store.stub_chain(:products, :find).and_return(product)
      end
      
      it "updates the requested product" do
        product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => product.id, :product => {'these' => 'params'}
      end

      it "assigns the requested product as @product" do
        put :update, :id => product.id
        assigns(:product).should eq(product)
      end

      it "redirects to the product" do
        put :update, :id => product.id
        response.should redirect_to(product)
      end
    end

    describe "with invalid params" do
      let(:product) { mock_model(Product, id: 5, update_attributes: false) }
      let(:current_store) { mock_model(Store) }

      before do
        controller.stub!(:current_store).and_return(current_store)
        current_store.stub_chain(:products, :find).and_return(product)
      end
      
      it "assigns the product as @product" do
        put :update, :id => product.id, :product => {}
        assigns(:product).should eq(product)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => product.id
        response.should render_template("edit")
      end
    end
  end

#  describe "DELETE destroy" do
#    it "destroys the requested product" do
#      product = Product.create! valid_attributes
#      expect {
#        delete :destroy, :id => product.id.to_s
#      }.to change(Product, :count).by(-1)
#    end

#    it "redirects to the products list" do
#      product = Product.create! valid_attributes
#      delete :destroy, :id => product.id.to_s
#      response.should redirect_to(products_url)
#    end
#  end

end
