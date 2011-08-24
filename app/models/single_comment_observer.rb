class SingleCommentObserver < Mongoid::Observer
  observe :store_comment, :product_comment
  
  def after_save(comment)
    #notification
    about = comment.send("#{comment.class.name.gsub(/Comment/, '').downcase}")
    notification = about.user.store_comment_notifications.find_or_initialize_by(about_id: comment.about_id, status: false)
    notification.update_attributes(from_id: comment.user_id, number: notification.number + 1)
  end
end
