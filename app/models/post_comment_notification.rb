class PostCommentNotification < Notification
  belongs_to :post_comment, :foreign_key => "about_id"
end