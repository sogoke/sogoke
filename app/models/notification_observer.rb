class NotificationObserver < Mongoid::Observer
  observe :user_relation
  
  def after_save(record)
    notification = record.user.send("#{record.class.name.underscore}_notifications").unread.find_or_create_by(sogoke_id: receiver_id)
    notification.update_attributes(number: (notification.number + 1))
  end
end
