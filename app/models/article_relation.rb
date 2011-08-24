class ArticleRelation < Relation
  belongs_to :following_article, :class_name => "Article", :foreign_key => "with_id"
end