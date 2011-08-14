class ArticleComment < Comment
  belongs_to :article, :class_name => "Article", :foreign_key => "sogoke_id"
end