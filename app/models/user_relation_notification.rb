class UserRelationNotification < Notification
  belongs_to :about, :class_name => "User", :foreign_key => "about_id"
end