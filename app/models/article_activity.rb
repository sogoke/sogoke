class ArticleActivity < Activity
  belongs_to :article, :foreign_key => "about_id"
end