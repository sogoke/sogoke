class ArticleComment < Comment
  belongs_to :article, :foreign_key => "about_id"
end