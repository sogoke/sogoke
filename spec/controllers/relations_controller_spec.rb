require 'spec_helper'

describe RelationsController do
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Relation" do
        expect {
          post :create, :relation => valid_attributes
        }.to change(Relation, :count).by(1)
      end

      it "assigns a newly created relation as @relation" do
        post :create, :relation => valid_attributes
        assigns(:relation).should be_a(Relation)
        assigns(:relation).should be_persisted
      end

      it "redirects to the created relation" do
        post :create, :relation => valid_attributes
        response.should redirect_to(Relation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved relation as @relation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relation.any_instance.stub(:save).and_return(false)
        post :create, :relation => {}
        assigns(:relation).should be_a_new(Relation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relation.any_instance.stub(:save).and_return(false)
        post :create, :relation => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested relation" do
      relation = Relation.create! valid_attributes
      expect {
        delete :destroy, :id => relation.id.to_s
      }.to change(Relation, :count).by(-1)
    end

    it "redirects to the relations list" do
      relation = Relation.create! valid_attributes
      delete :destroy, :id => relation.id.to_s
      response.should redirect_to(relations_url)
    end
  end

end
