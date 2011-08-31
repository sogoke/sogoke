class CommentObserver < Mongoid::Observer
  observe :store_comment, :product_comment, :post_comment, :article_comment
  
  def after_save(comment)
    comment.send_notification
  end
end
