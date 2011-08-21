class FavoriteProduct < Favorite  
  belongs_to :product, :foreign_key => "favorite_id"
end