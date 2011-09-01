require 'spec_helper'

describe BuzzsController do
  describe "GET show" do
    let(:buzz) { mock_model(Buzz, id: 5) }
    
    it "assigns the requested buzz as @buzz" do
      Buzz.stub!(:find).and_return(buzz)
      get :show, :id => buzz.id
      
      Buzz.should_receive(:find).and_return(buzz)
      assigns(:buzz).should eq(buzz)
    end
  end

  describe "GET edit" do
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
    describe "with valid params" do
      it "creates a new Buzz" do
        expect {
          post :create, :buzz => valid_attributes
        }.to change(Buzz, :count).by(1)
      end

      it "assigns a newly created buzz as @buzz" do
        post :create, :buzz => valid_attributes
        assigns(:buzz).should be_a(Buzz)
        assigns(:buzz).should be_persisted
      end

      it "redirects to the created buzz" do
        post :create, :buzz => valid_attributes
        response.should redirect_to(Buzz.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved buzz as @buzz" do
        # Trigger the behavior that occurs when invalid params are submitted
        Buzz.any_instance.stub(:save).and_return(false)
        post :create, :buzz => {}
        assigns(:buzz).should be_a_new(Buzz)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Buzz.any_instance.stub(:save).and_return(false)
        post :create, :buzz => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested buzz" do
        buzz = Buzz.create! valid_attributes
        Buzz.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => buzz.id, :buzz => {'these' => 'params'}
      end

      it "assigns the requested buzz as @buzz" do
        buzz = Buzz.create! valid_attributes
        put :update, :id => buzz.id, :buzz => valid_attributes
        assigns(:buzz).should eq(buzz)
      end

      it "redirects to the buzz" do
        buzz = Buzz.create! valid_attributes
        put :update, :id => buzz.id, :buzz => valid_attributes
        response.should redirect_to(buzz)
      end
    end

    describe "with invalid params" do
      it "assigns the buzz as @buzz" do
        buzz = Buzz.create! valid_attributes
        Buzz.any_instance.stub(:save).and_return(false)
        put :update, :id => buzz.id.to_s, :buzz => {}
        assigns(:buzz).should eq(buzz)
      end

      it "re-renders the 'edit' template" do
        buzz = Buzz.create! valid_attributes
        Buzz.any_instance.stub(:save).and_return(false)
        put :update, :id => buzz.id.to_s, :buzz => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
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
