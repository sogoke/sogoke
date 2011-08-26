require 'spec_helper'

describe PostsController do

  describe "GET index" do
    let(:posts) { [ mock_model(Post), mock_model(Post) ] }
    
    before do
      Post.stub!(:find).and_return(posts)
    end
    
    it "assigns all posts as @posts" do
      get :index
      assigns(:posts).should eq(posts)
      
      response.should render_template(:index)
    end
  end

  describe "GET show" do
    let(:post) { mock_model(Post, id: 5) }
    let(:current_user) { mock_model( User, post_comments: [ mock_model(Comment)] ) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:post_comments, :new)
    end
    
    it "assigns the requested post as @post" do
      Post.should_receive(:find).with("5").and_return(post)
      
      get :show, :id => post.id
      assigns(:post).should eq(post)
      assigns(:post).id.should eq(5)
      response.should render_template(:show)
    end
  end

  describe "GET new" do
    login_user
    let(:post) { mock_model(Post) }
    let(:current_user) { mock_model(User) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:posts, :new).and_return(post)
    end
    
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should eq(post)
      response.should render_template(:new)
    end
  end

  describe "GET edit" do
    login_user
    let(:post) { mock_model(Post, id: 5) }
    let(:current_user) { mock_model(Store) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:posts, :find).and_return(post)
    end
    
    it "assigns the requested post as @post" do
      get :edit, :id => post.id
      assigns(:post).should eq(post)
      
      assigns(:post).id.should eq(5)
      
      response.should render_template(:edit)
    end
  end

  describe "POST create" do
    login_user
    describe "with valid params" do
      let(:post_new) { mock_model(Post, id: 5, save: true) }
      let(:current_user) { mock_model(Store) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:posts, :new).and_return(post_new)
      end
      
      it "assigns a newly created post as @post" do
        post :create, :post => {:title => "Hello"}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, :post => {:title => "Hello"}
        response.should redirect_to("/posts/5")
      end
    end

    describe "with invalid params" do
      let(:post_new) { mock_model(Post, id: 5, save: false) }
      let(:current_user) { mock_model(Store) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:posts, :new).and_return(post_new)
      end

      it "re-renders the 'new' template" do
        post :create, :post => {:title => "Hello"}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    login_user
    describe "with valid params" do
      let(:post) { mock_model(Post, id: 5, update_attributes: true) }
      let(:current_user) { mock_model(Store) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:posts, :find).and_return(post)
      end
      
      it "updates the requested post" do
        post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => post.id, :post => {'these' => 'params'}
      end

      it "assigns the requested post as @post" do
        put :update, :id => post.id
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        put :update, :id => post.id
        response.should redirect_to(post)
      end
    end

    describe "with invalid params" do
      let(:post) { mock_model(Post, id: 5, update_attributes: false) }
      let(:current_user) { mock_model(Store) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:posts, :find).and_return(post)
      end
      
      it "assigns the post as @post" do
        put :update, :id => post.id, :post => {}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => post.id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    login_user
    let(:post) { mock_model(Post, id: 5, destroy: true) }
    let(:current_user) { mock_model(User) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:posts, :find).and_return(post)
    end
    
    it "destroys the requested post" do
      delete :destroy, :id => post.id
      
      assigns(:post).id.should eq(5)
      response.should redirect_to(posts_url)
    end
  end
end
