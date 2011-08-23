class ArticleRelation < Relation
  belongs_to :following_article, :class_name => "Article", :foreign_key => "receiver_id"
end