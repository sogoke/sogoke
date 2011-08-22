class InvitationObserver < Mongoid::Observer
  observe :invitation
  
  def after_save(record)
    record.user.consume_invitation
        
    Resque.enqueue( InvitationMailResque, record.id )
  end
end