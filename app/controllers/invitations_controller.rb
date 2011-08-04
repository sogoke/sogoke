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
    redirect_to(new_user_registration_path) if Invitation.exists?(conditions: {id: params[:id]})
  end
  
  def send_invitations_to_friends
    if request.post?
      Invitation.send_invitations_to_friends(params[:words_from_friend], params[:friends_mails])
      redirect_to root_path, :notice => I18n.t("invite_friends_successful")
    else
      
    end
  end
end
