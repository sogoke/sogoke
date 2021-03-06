class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def show
    notification = current_user.notifications.find(params[:id])
    redirect_to notification.from_path
  end
  
  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
    
    redirect_to notifications_path
  end
end
