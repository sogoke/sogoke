class StoreComment < Comment
  belongs_to :store, :class_name => "Store", :foreign_key => "sogoke_id"
end