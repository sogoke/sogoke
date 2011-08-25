class PostCommentNotification < Notification
  belongs_to :post_comment, :foreign_key => "about_id"
  
  def from_path
    post_path(post_comment.post)
  end
end