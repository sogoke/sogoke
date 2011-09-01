class ActivityObserver < Mongoid::Observer
  observe :buzz, :product, :article, :post, :user_relation
  
  def after_save(record)
    record.create_activity user_id: record.user_id, about_id: record.id
  end
end
