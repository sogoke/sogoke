class MultiCommentObserver < Mongoid::Observer
  observe :post_comment, :article_comment
  
  def after_save(comment)
    comment.send_notification
  end
end
