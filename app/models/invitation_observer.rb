class InvitationObserver < Mongoid::Observer
  observe :invitation
  
  def after_create(record)
    Resque.enqueue( InvitationMailResque, record.id )
  end
end
