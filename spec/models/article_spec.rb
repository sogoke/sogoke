require 'spec_helper'

describe Article do
  it "is wrong if title is nil" do
    Article.new.should have(1).error_on(:title)
  end
  
  it "is wrong if content is nil" do
    Article.new.should have(1).error_on(:content)
  end
  
  it "is wrong if user_id is nil" do
    Article.new.should have(1).error_on(:user_id)
  end
  
  it "build relation between user and article" do
    user = Factory.create :user
    article = user.articles.create title: "Woold", content: "Would"
    
    ArticleRelation.should_receive(:create).with(user_id: user.id, with_id: article.id)
    
    article.build_relation
  end
  
  it "build relation between following and article" do
    user = Factory.create :user
    following_user = Factory.create :following_user
    article = user.articles.create title: "Woold", content: "Would"
    
    ArticleRelation.should_receive(:create).with(user_id: following_user.id, with_id: article.id)
    
    article.build_relation(following_user.id)
  end
end
