class ActivitiesController < ApplicationController
  def index
    @activities = User.find(params[:user_id]).activities
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    
    redirect_to activities_url
  end
end
