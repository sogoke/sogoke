class FavoriteProduct < Favorite
  validates_uniqueness_of :user_id, :scope => :favorite_id
  
  belongs_to :product, :class_name => "Product", :foreign_key => "favorite_id"
end