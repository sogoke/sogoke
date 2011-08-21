class InvitationMailResque
  @queue = :mail
  
  def self.perform(invitation_id)
    invitation = Invitation.find(invitation_id)
    
    if invitation.words_from_friend.nil? 
      InvitationMail.site_invitation(invitation).deliver
    else
      InvitationMail.friend_invitation(invitation).deliver
    end
  end
end