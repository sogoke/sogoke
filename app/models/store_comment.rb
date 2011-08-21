class StoreComment < Comment
  belongs_to :store, :foreign_key => "sogoke_id"
end