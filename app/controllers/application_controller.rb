class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_store
  
  def current_store
    current_user.store
  end
end
