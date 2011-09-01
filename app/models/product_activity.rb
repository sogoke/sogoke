class ProductActivity < Activity
  belongs_to :product, :foreign_key => "about_id"
end