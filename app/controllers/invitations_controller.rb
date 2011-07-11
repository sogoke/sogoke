class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new params[:invitation]
    if @invitation.save
      redirect_to :action => :successful
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
  
  def successful
    @invitation = Invitation.last
  end
end
