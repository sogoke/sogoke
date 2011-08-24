require 'spec_helper'

describe SingleCommentObserver do
  describe "store comments after save" do
    let(:observer) { SingleCommentObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:following_user) { Factory.create(:following_user) }
    let(:store) { Store.create(name: "Hello", announcement: "World", user_id: user.id) }
    let(:comment) { following_user.store_comments.build(content: "World", about_id: store.id) }
    let(:comment_second) { following_user.store_comments.build(content: "World", about_id: store.id) }
    let(:comment_third) { following_user.store_comments.build(content: "World", about_id: store.id) }
    

    it "creates relation between user and post" do
      observer.after_save(comment)
      user.store_comment_notifications.count.should eq(1)
      observer.after_save(comment_second)
      user.store_comment_notifications.count.should eq(1)
      user.store_comment_notifications.first.number.should eq(2)
      
      user.store_comment_notifications.first.update_attributes status: true
      observer.after_save(comment_third)
      user.store_comment_notifications.unread.count.should eq(1)
      user.store_comment_notifications.count.should eq(2)
    end 
  end
end
