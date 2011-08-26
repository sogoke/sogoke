require 'spec_helper'

describe StoresController do

  describe "GET show" do
    let(:store) { mock_model(Store, id: 5) }
    
    before do
      Store.stub!(:find).and_return(store)
    end
        
    it "assigns the requested store as @store" do
      Store.should_receive(:find).with("5").and_return(store)
      
      get :show, :id => store.id
      
      assigns(:store).id.should eq(5)
      response.should render_template(:show)
    end
  end

  describe "GET edit" do
    login_user
    let(:current_store) { mock_model(Store, id: 5) }
    
    it "assigns the requested store as @store" do
      get :edit, :id => current_store.id
      response.should render_template(:edit)
    end
  end

  describe "PUT update" do
    login_user
    describe "with valid params" do
      let(:current_store) { mock_model(Store, id: 5, update_attributes: true)}
      
      before do
        controller.stub!(:current_store).and_return(current_store)
      end
      
      it "updates the requested store" do
        current_store.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => current_store.id, :store => {'these' => 'params'}
      end

      it "redirects to the store" do
        put :update, :id => current_store.id
        response.should redirect_to(edit_store_path)
      end
    end

    describe "with invalid params" do
      let(:current_store) { mock_model(Store, id: 5, update_attributes: false)}
      
      before do
        controller.stub!(:current_store).and_return(current_store)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => current_store.id
        response.should redirect_to(edit_store_path)
      end
    end
  end
end
