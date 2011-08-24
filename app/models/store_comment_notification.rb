class StoreCommentNotification < Notification
  belongs_to :store_comment, :foreign_key => "about_id"
end