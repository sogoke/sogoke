class InvitationMail < ActionMailer::Base
  default from: "no-reply@sogoke.com"
  
  def site_invitation(record)
    @invitation = record
    
    mail(:to => @invitation.email) do |format|
      format.html { render 'site_invitation_mail' }
    end
  end
  
  def friend_invitation(record)
    @invitation = record
    
    mail(:to => @invitation.email) do |format|
      format.html { render 'friend_invitation_mail' }
    end
  end
end
