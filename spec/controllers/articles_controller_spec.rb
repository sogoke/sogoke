require 'spec_helper'

describe ArticlesController do
  describe "GET index" do
    let(:articles) { [ mock_model(Article), mock_model(Article) ] }
    
    before do
      User.stub_chain(:find, :articles, :all).and_return(articles)
    end
    
    it "assigns all articles as @articles" do
      get :index, :user_id => 5
      assigns(:articles).should eq(articles)
      response.should render_template(:index)
    end
  end

  describe "GET show" do
    let(:article) { mock_model(Article, id: 5) }
    let(:current_user) { mock_model( User, article_comments: [ mock_model(Comment)] ) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:article_comments, :new)
    end
    
    it "assigns the requested article as @article" do
      Article.should_receive(:find).with("5").and_return(article)
      
      get :show, :id => article.id
      assigns(:article).should eq(article)
      assigns(:article).id.should eq(5)
      response.should render_template(:show)
    end
  end

  describe "GET new" do
    let(:article) { mock_model(Article) }
    let(:current_user) { mock_model(User) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:articles, :new).and_return(article)
    end
    
    it "assigns a new article as @article" do
      get :new
      assigns(:article).should eq(article)
      response.should render_template(article)
    end
  end

  describe "GET edit" do
    let(:article) { mock_model(Article, id: 5) }
    let(:current_user) { mock_model(User) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:articles, :find).and_return(article)
    end
    
    it "assigns the requested article as @article" do
      get :edit, :id => article.id
      assigns(:article).should eq(article)
      
      assigns(:article).id.should eq(5)
      
      response.should render_template(:edit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:article) { mock_model(Article, id: 5, save: true) }
      let(:current_user) { mock_model(User) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:articles, :new).and_return(article)
      end
      
      it "assigns a newly created article as @article" do
        post :create, :article => {id: 5}
        assigns(:article).should be_a(Article)
        assigns(:article).should be_persisted
      end

      it "redirects to the created article" do
        post :create, :article => {id: 5}
        response.should redirect_to("/articles/5")
      end
    end

    describe "with invalid params" do
      let(:article) { mock_model(Article, id: 5, save: false) }
      let(:current_user) { mock_model(User) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:articles, :new).and_return(article)
      end

      it "re-renders the 'new' template" do
        post :create, :article => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:article) { mock_model(Article, id: 5, update_attributes: true) }
      let(:current_user) { mock_model(User) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:articles, :find).and_return(article)
      end
      
      it "updates the requested article" do
        article.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => article.id, :article => {'these' => 'params'}
      end

      it "assigns the requested article as @article" do
        put :update, :id => article.id
        assigns(:article).should eq(article)
      end

      it "redirects to the article" do
        put :update, :id => article.id
        response.should redirect_to(article)
      end
    end

    describe "with invalid params" do
      let(:article) { mock_model(Article, id: 5, update_attributes: false) }
      let(:current_user) { mock_model(User) }

      before do
        controller.stub!(:current_user).and_return(current_user)
        current_user.stub_chain(:articles, :find).and_return(article)
      end
      
      it "assigns the article as @article" do
        put :update, :id => article.id, :article => {}
        assigns(:article).should eq(article)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => article.id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let(:article) { mock_model(Article, id: 5, destroy: true) }
    let(:current_user) { mock_model(User) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:articles, :find).and_return(article)
    end
    
    it "destroys the requested article" do
      delete :destroy, :id => article.id
      
      assigns(:article).id.should eq(5)
      response.should redirect_to(user_articles_path(current_user))
    end
  end
end
