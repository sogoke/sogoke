class UsersController < ApplicationController
  def inactive
  end
  
  def show
    @user = User.find(params[:id])
  end
end
