require 'spec_helper'

describe RelationsController do
  describe "POST create" do
    login_user
    let(:current_user) { mock_model(User) }
    let(:relation) { mock_model(UserRelation, id: 5) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:following_users, :create).and_return(relation)
    end
    
    describe "with valid params" do
      it "creates a new Relation" do
        current_user.should_receive(:following_users).once
        post :create, { relation: { receiver_id: 3 }, token: "user" }
        response.body.should eq({ relation_id: 5 }.to_json)
      end
    end
  end

  describe "DELETE destroy" do
    login_user
    let(:current_user) { mock_model(User) }
    let(:following) { mock_model(User, id: 6) }
    let(:relation) { mock_model(UserRelation, id: 5, destroy: true, followed_user: following) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:following_users, :find).and_return(relation)
      relation.stub!(:following_user).and_return(following)
    end
    
    it "destroys the requested relation" do
      relation.should_receive(:destroy)
      delete :destroy, {:id => relation.id, token: "user"}
      response.body.should eq({ sogoke_id: 6 }.to_json)
    end
  end

end
