class RegistrationsController < Devise::RegistrationsController
  
  protected
  def after_inactive_sign_up_path_for(resource)
    users_inactive_path
  end
end
