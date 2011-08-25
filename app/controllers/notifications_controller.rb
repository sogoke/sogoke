class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
  end

  def show
    @notification = current_user.notifications.find(params[:id])
  end
  
  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
  end
end
