class RelationObserver < Mongoid::Observer
  observe :post, :article, :post_comment, :article_comment
  
  def after_save(record)
    if record.is_a?(Comment)
      "#{record.class.name.gsub(/Comment/, '')}Relation".constantize.create user_id: record.user_id, receiver_id: record.sogoke_id
    else
      "#{record.class.name}Relation".constantize.create user_id: record.user_id, receiver_id: record.id
    end
  end
end