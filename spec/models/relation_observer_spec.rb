require 'spec_helper'

describe RelationObserver do
  describe "post after save" do
    let(:observer) { RelationObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:post) { user.posts.build(title: "Hello", content: "World") }
    
    it "creates relation between user and post" do
      PostRelation.should_receive(:create).with(user_id: user.id, receiver_id: post.id)
      observer.after_save(post)
    end 
  end
  
  describe "post comments after save" do
    let(:observer) { RelationObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:post) { user.posts.build(title: "Hello", content: "World") }
    let(:comment) { user.post_comments.build(content: "World", sogoke_id: post.id) }
    
    it "creates relation between user and post" do
      PostRelation.should_receive(:create).with(user_id: user.id, receiver_id: post.id)
      observer.after_save(comment)
    end 
  end
end
