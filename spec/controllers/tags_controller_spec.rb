require 'spec_helper'

describe TagsController do
  def valid_attributes
    {name: "Wood"}
  end

  describe "GET index" do
    it "assigns all tags as @tags" do
      tag = Tag.create! valid_attributes
      get :index
      assigns(:tags).should eq([tag])
    end
  end

  describe "GET show" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :show, :id => tag.id.to_s
      assigns(:tag).should eq(tag)
    end
  end

  describe "GET new" do
    it "assigns a new tag as @tag" do
      get :new
      assigns(:tag).should be_a_new(Tag)
    end
  end

  describe "GET edit" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :edit, :id => tag.id.to_s
      assigns(:tag).should eq(tag)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tag" do
        expect {
          post :create, :tag => valid_attributes
        }.to change(Tag, :count).by(1)
      end

      it "assigns a newly created tag as @tag" do
        post :create, :tag => valid_attributes
        assigns(:tag).should be_a(Tag)
        assigns(:tag).should be_persisted
      end

      it "redirects to the created tag" do
        post :create, :tag => valid_attributes
        response.should redirect_to(Tag.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tag as @tag" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        post :create, :tag => {}
        assigns(:tag).should be_a_new(Tag)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        post :create, :tag => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tag" do
        tag = Tag.create! valid_attributes
        Tag.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => tag.id, :tag => {'these' => 'params'}
      end

      it "assigns the requested tag as @tag" do
        tag = Tag.create! valid_attributes
        put :update, :id => tag.id, :tag => valid_attributes
        assigns(:tag).should eq(tag)
      end

      it "redirects to the tag" do
        tag = Tag.create! valid_attributes
        put :update, :id => tag.id, :tag => valid_attributes
        response.should redirect_to(tag)
      end
    end

    describe "with invalid params" do
      it "assigns the tag as @tag" do
        tag = Tag.create! valid_attributes
        Tag.any_instance.stub(:save).and_return(false)
        put :update, :id => tag.id.to_s, :tag => {}
        assigns(:tag).should eq(tag)
      end

      it "re-renders the 'edit' template" do
        tag = Tag.create! valid_attributes
        Tag.any_instance.stub(:save).and_return(false)
        put :update, :id => tag.id.to_s, :tag => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tag" do
      tag = Tag.create! valid_attributes
      expect {
        delete :destroy, :id => tag.id.to_s
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the tags list" do
      tag = Tag.create! valid_attributes
      delete :destroy, :id => tag.id.to_s
      response.should redirect_to(tags_path)
    end
  end

end
