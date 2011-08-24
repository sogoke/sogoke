class SingleCommentObserver < Mongoid::Observer
  observe :store_comment, :product_comment
  
  def after_save(comment)
    comment.send_notification
  end
end
