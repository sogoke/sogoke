require 'spec_helper'

describe MultiCommentObserver do
  describe "post comments after save" do
    let(:observer) { MultiCommentObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:following_user) { Factory.create(:following_user) }
    let(:post) { user.posts.create(title: "Hello", content: "World") }
    let(:comment) { following_user.post_comments.build(content: "World", about_id: post.id) }
    let(:comment_second) { following_user.post_comments.build(content: "World", about_id: post.id) }
    let(:comment_third) { following_user.post_comments.build(content: "World", about_id: post.id) }
    

    it "creates relation between user and post" do
      observer.after_save(comment)
      user.post_comment_notifications.count.should eq(1)
      observer.after_save(comment_second)
      user.post_comment_notifications.count.should eq(1)
      user.post_comment_notifications.first.number.should eq(2)
      
      user.post_comment_notifications.first.update_attributes status: true
      observer.after_save(comment_third)
      user.post_comment_notifications.unread.count.should eq(1)
      user.post_comment_notifications.count.should eq(2)
    end 
  end
  
  describe "article comments after save" do
    let(:observer) { MultiCommentObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:following_user) { Factory.create(:following_user) }
    let(:article) { user.articles.create(title: "Hello", content: "World") }
    let(:comment) { following_user.article_comments.build(content: "World", about_id: article.id) }
    let(:comment_second) { following_user.article_comments.build(content: "World", about_id: article.id) }
    let(:comment_third) { following_user.article_comments.build(content: "World", about_id: article.id) }
    

    it "creates relation between user and post" do
      observer.after_save(comment)
      user.article_comment_notifications.count.should eq(1)
      observer.after_save(comment_second)
      user.article_comment_notifications.count.should eq(1)
      user.article_comment_notifications.first.number.should eq(2)
      
      user.article_comment_notifications.first.update_attributes status: true
      observer.after_save(comment_third)
      user.article_comment_notifications.unread.count.should eq(1)
      user.article_comment_notifications.count.should eq(2)
    end 
  end
end
