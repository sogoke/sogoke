class BuzzCommentNotification < Notification
  belongs_to :buzz_comment, :foreign_key => "about_id"
  
  def from_path
    buzz_path(buzz_comment.buzz)
  end
end