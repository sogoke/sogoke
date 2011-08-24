class MultiCommentObserver < Mongoid::Observer
  observe :post_comment, :article_comment
  
  def after_save(comment)
    #notification
    about = comment.send("#{comment.class.name.gsub(/Comment/, '').downcase}")
    
    
    #relation
    "#{comment.class.name.gsub(/Comment/, '')}Relation".constantize.create user_id: record.user_id, with_id: record.about_id
  end
end
