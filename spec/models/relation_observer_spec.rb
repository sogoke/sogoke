require 'spec_helper'

describe RelationObserver do
  describe "post after save" do
    let(:observer) { RelationObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:post) { user.posts.create(title: "Hello", content: "World") }
    
    it "creates relation between user and post" do
      PostRelation.should_receive(:create).with(user_id: user.id, receiver_id: post.id)
      observer.after_save(post)
    end 
  end
end
