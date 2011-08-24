class FavoriteStore < Favorite  
  belongs_to :store, :foreign_key => "about_id"
end