class UserRelationNotification < Notification
  belongs_to :user_relation, :class_name => "UserRelation", :foreign_key => "sogoke_id"
end