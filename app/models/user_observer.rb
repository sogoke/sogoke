class UserObserver < Mongoid::Observer
  observe :user
  
  def after_create(user)
    Store.create user_id: user.id, name: user.name
    Preference.create user_id: user.id
  end
end
