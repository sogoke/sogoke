class FavoriteStore < Favorite  
  belongs_to :store, :class_name => "Store", :foreign_key => "favorite_id"
end