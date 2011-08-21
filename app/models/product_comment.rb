class ProductComment < Comment
  belongs_to :product, :foreign_key => "sogoke_id"
end