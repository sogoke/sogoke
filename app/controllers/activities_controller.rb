class ActivitiesController < ApplicationController
  def index
    @activities = User.find(params[:user_id]).activities
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy
    
    redirect_to user_activities_path(current_user)
  end
end
