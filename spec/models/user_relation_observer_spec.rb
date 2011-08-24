require 'spec_helper'

describe UserRelationObserver do
  let(:observer) { UserRelationObserver.instance }
  let(:user) { Factory.create(:user) }
  let(:following_user) { Factory.create(:following_user) }
  let(:relation) { user.following_users.build(receiver_id: following_user.id) }
  
  it "creates notification between user and user" do    
    #following_user.should_receive(:user_relation_notifications)
    observer.after_save(relation)
    following_user.notifications.count.should eq(1)
  end
end
