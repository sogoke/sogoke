class FavoriteArticle < Favorite
  belongs_to :article, :foreign_key => "favorite_id"
end