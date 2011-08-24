class RelationObserver < Mongoid::Observer
  observe :post, :article
  
  def after_save(record)
    "#{record.class.name}Relation".constantize.create user_id: record.user_id, with_id: record.id
  end
end