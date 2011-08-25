class ArticleCommentNotification < Notification
  belongs_to :article_comment, :foreign_key => "about_id"
  
  def from_path
    article_path(article_comment.article)
  end
end