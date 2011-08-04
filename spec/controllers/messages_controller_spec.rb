require 'spec_helper'

describe MessagesController do
  let(:messages) { [mock_model(Message), mock_model(Message)] }
  let(:current_user) { mock_model(User) }
  
  describe "GET index" do
    it "assigns all messages as @messages" do
      message = Message.create! valid_attributes
      get :index
      assigns(:messages).should eq([message])
    end
  end

  describe "GET show" do
    it "assigns the requested message as @message" do
      message = Message.create! valid_attributes
      get :show, :id => message.id.to_s
      assigns(:message).should eq(message)
    end
  end

  describe "GET new" do
    it "assigns a new message as @message" do
      get :new
      assigns(:message).should be_a_new(Message)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, :message => valid_attributes
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, :message => valid_attributes
        assigns(:message).should be_a(Message)
        assigns(:message).should be_persisted
      end

      it "redirects to the created message" do
        post :create, :message => valid_attributes
        response.should redirect_to(Message.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        post :create, :message => {}
        assigns(:message).should be_a_new(Message)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        post :create, :message => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      message = Message.create! valid_attributes
      expect {
        delete :destroy, :id => message.id.to_s
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the messages list" do
      message = Message.create! valid_attributes
      delete :destroy, :id => message.id.to_s
      response.should redirect_to(messages_url)
    end
  end

end
