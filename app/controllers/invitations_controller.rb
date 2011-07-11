class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new params[:invitation]
    if @invitation.save
      render 'successful'
    else
      render 'new'
    end
  end
  
  def show
    begin
      Invitation.find(params[:id])
      redirect_to new_user_registration_path
    rescue
      
    end
  end
end
