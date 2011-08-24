class TagObserver < Mongoid::Observer
  observe :article, :preference, :product, :post, :store
  
  def after_save(record)
    record.tags_array.each do |tag|
      Tag.create name: tag
    end
  end
end