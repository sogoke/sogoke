class ArticleCommentNotification < Notification
  belongs_to :article_comment, :foreign_key => "about_id"
end