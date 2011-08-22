class InvitationObserver < Mongoid::Observer
  observe :invitation
  
  def after_save(record)
    record.user.consume_invitation if record.user_id
        
    Resque.enqueue( InvitationMailResque, record.id )
  end
end