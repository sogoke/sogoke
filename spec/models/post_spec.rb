require 'spec_helper'

describe Post do
  it "is wrong if title is nil" do
    Post.new.should have(1).error_on(:title)
  end
  
  it "is wrong if content is nil" do
    Post.new.should have(1).error_on(:content)
  end
  
  it "is wrong if user_id is nil" do
    Post.new.should have(1).error_on(:user_id)
  end
  
  it "build relation between user and article" do
    user = Factory.create :user
    post = user.posts.create title: "Woold", content: "Would"
    
    PostRelation.should_receive(:create).with(user_id: user.id, with_id: post.id)
    
    post.build_relation
  end
  
  it "build relation between following and article" do
    user = Factory.create :user
    following_user = Factory.create :following_user
    post = user.posts.create title: "Woold", content: "Would"
    
    PostRelation.should_receive(:create).with(user_id: following_user.id, with_id: post.id)
    
    post.build_relation(following_user.id)
  end
end
