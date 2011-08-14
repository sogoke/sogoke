class ProductComment < Comment
  belongs_to :product, :class_name => "Product", :foreign_key => "sogoke_id"
end