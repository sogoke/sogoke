class BuzzComment < Comment
  belongs_to :buzz, :foreign_key => "about_id"
  
  def send_notification
    buzz.relationships.each do |relation|
      notification! relation.user.buzz_comment_notifications
    end
    
    buzz.build_relation user_id
  end
end