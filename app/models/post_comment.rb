class PostComment < Comment
  belongs_to :post, :foreign_key => "about_id"
  
  def send_notification
    post.relationships.each do |relation|
      notification! relation.user.post_comment_notifications
    end
    
    post.build_relation user_id
  end
end