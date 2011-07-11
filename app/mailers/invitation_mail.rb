class InvitationMail < ActionMailer::Base
  default from: "no-reply@sogoke.com"
  
  def invitation(record)
    @invitation = record
    
    mail(:to => @invitation.email) do |format|
      format.html { render 'invitation_mail' }
    end
  end
end
