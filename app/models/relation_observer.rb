class RelationObserver < Mongoid::Observer
  observe :post, :article
  
  def after_save(record)
    "#{record.class.to_s}Relation".constantize.create user_id: record.user_id, receiver_id: record.id
  end
end