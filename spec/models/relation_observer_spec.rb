require 'spec_helper'

describe RelationObserver do
  describe "post after save" do
    let(:observer) { RelationObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:post) { user.posts.build(title: "Hello", content: "World") }
    
    it "creates relation between user and post" do
      PostRelation.should_receive(:create).with(user_id: user.id, with_id: post.id)
      observer.after_save(post)
    end 
  end
  
  describe "buzz after save" do
    let(:observer) { RelationObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:buzz) { user.buzzs.build(content: "World") }
    
    it "creates relation between user and buzz" do
      BuzzRelation.should_receive(:create).with(user_id: user.id, with_id: buzz.id)
      observer.after_save(buzz)
    end 
  end
end
