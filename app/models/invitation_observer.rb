class InvitationObserver < Mongoid::Observer
  observe :invitation
  
  def after_create(record)
    InvitationMail.invitation(record).deliver
  end
end
