class UserRelationObserver < Mongoid::Observer
  observe :user_relation
  
  def after_save(record)
    record.following_user.user_relation_notifications.create(sogoke_id: record.user_id)
  end
end
