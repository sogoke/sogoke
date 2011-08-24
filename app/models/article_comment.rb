class ArticleComment < Comment
  belongs_to :article, :foreign_key => "about_id"
  
  def send_notification
    article.relationships.each do |relation|
      notification! relation.user.article_comment_notifications
    end
    
    article.build_relation user_id
  end
end