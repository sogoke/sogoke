require 'spec_helper'

describe BuzzsController do
  describe "GET show" do
    let(:buzz) { mock_model(Buzz, id: 5) }
    
    it "assigns the requested buzz as @buzz" do
      Buzz.stub!(:find).and_return(buzz)
      get :show, :id => buzz.id
      
      assigns(:buzz).should eq(buzz)
      response.should render_template(:show)
    end
  end

  describe "GET edit" do
    login_user
    let(:current_user) { mock_model(User) }
    let(:buzz) { mock_model(Buzz, id: 5) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:buzzs, :find).and_return(buzz)
    end
    
    it "assigns the requested buzz as @buzz" do
      get :edit, id: 5
      
      assigns(:buzz).should eq(buzz)
      response.should render_template(:edit)
    end
  end

  describe "POST create" do
    login_user
    let(:current_user) { mock_model(User) }
    let(:buzz) { mock_model(Buzz, id: 5, save: true) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:buzzs, :new).and_return(buzz)
    end
    
    describe "with valid params" do
      it "assigns a newly created buzz as @buzz" do
        post :create, buzz: { content: "World" }
        assigns(:buzz).should eq(buzz)
        
        response.should redirect_to("/")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved buzz as @buzz" do
        buzz.stub!(:save).and_return(false)
        post :create, :buzz => {}
        response.should render_template("home/index")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      login_user
      let(:current_user) { mock_model(User) }
      let(:buzz) { mock_model(Buzz, id: 5, update_attributes: true) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:buzzs, :find).and_return(buzz)
      end
      
      it "assigns the requested buzz as @buzz" do
        put :update, :id => buzz.id
        assigns(:buzz).should eq(buzz)
        
        response.should redirect_to(buzz)
      end
    end

    describe "with invalid params" do
      login_user
      let(:current_user) { mock_model(User) }
      let(:buzz) { mock_model(Buzz, id: 5, update_attributes: true) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:buzzs, :find).and_return(buzz)
      end
      
      it "assigns the buzz as @buzz" do
        buzz.stub(:update_attributes).and_return(false)
        put :update, :id => buzz.id.to_s, :buzz => {}
        
        assigns(:buzz).should eq(buzz)
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    login_user
    let(:current_user) { mock_model(User) }
    let(:buzz) { mock_model(Buzz, id: 5, destroy: true) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:buzzs, :find).and_return(buzz)
    end

    it "redirects to the buzzs list" do
      delete :destroy, :id => buzz.id
      
      assigns(:buzz).should eq(buzz)
      response.should redirect_to(buzzs_url)
    end
  end

end
