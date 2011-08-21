class ArticleComment < Comment
  belongs_to :article, :foreign_key => "sogoke_id"
end