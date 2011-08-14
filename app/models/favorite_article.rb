class FavoriteArticle < Favorite
  belongs_to :article, :class_name => "Article", :foreign_key => "favorite_id"
end