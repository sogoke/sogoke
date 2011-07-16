class InvitationObserver < Mongoid::Observer
  observe :invitation
  
  def after_create(record)
    record.words_from_friend.nil? ? InvitationMail.site_invitation(record).deliver : InvitationMail.friend_invitation(record).deliver
  end
end
