class UserRelationObserver < Mongoid::Observer
  observe :user_relation
  
  def after_save(relation)
    relation.following_user.user_relation_notifications.create(from_id: relation.user_id)
  end
end
