require 'spec_helper'

describe CommentsController do

  describe "POST 'create'" do
    let(:current_user) { mock_model(User, id: 5) }
    let(:comment) { mock_model(Comment, user_id: 5) }
    let(:article) { mock_model(Article, id: 3) }
    
    before do
      controller.stub!(:current_user).and_return(current_user)
      current_user.stub_chain(:article_comments, :new).and_return(comment)
      Article.stub!(:find).and_return(article)
    end
    
    it "should be successful" do      
      comment.stub!(:save).and_return(true)
      post 'create', article_id: "5", article_comment: { content: "Hello World" }, token: "article"
      
      assigns(:comment).user_id.should eq(5)
    end
    
    it "should be wrong" do
      comment.stub!(:save).and_return(false)
      post 'create', article_id: "5", article_comment: { content: "Hello World" }, token: "article"
      
      response.should render_template("articles/show")
    end
  end

#  describe "GET 'destroy'" do
#    it "should be successful" do
#      delete 'destroy'
#      response.should be_success
#    end
#  end
end
