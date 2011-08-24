class StoreComment < Comment
  belongs_to :store, :foreign_key => "about_id"
  
  def send_notification
    notification! store.user.store_comment_notifications
  end
end