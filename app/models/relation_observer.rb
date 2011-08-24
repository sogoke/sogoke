class RelationObserver < Mongoid::Observer
  observe :post, :article
  
  def after_save(record)
    record.build_relation
  end
end