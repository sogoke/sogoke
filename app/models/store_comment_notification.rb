class StoreCommentNotification < Notification
  belongs_to :store_comment, :foreign_key => "about_id"
  
  def from_path
    store_path(store_comment.store)
  end
end