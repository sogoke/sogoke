class FavoriteStore < Favorite
  validates_uniqueness_of :user_id, :scope => :favorite_id
  
  belongs_to :store, :class_name => "Store", :foreign_key => "favorite_id"
end