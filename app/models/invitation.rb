class Invitation
  include Mongoid::Document
  
  field :name
  field :email
  field :description
  field :words_from_friend
  field :user_id
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email_format: true
  
  belongs_to :user
  
  def self.send_invitations_to_friends(user, words_from_friend, friends_mails)
    mail_list = friends_mails.split(",")
    return false if !user.still_have_invitations_left(mail_list.length)
    
    mail_list.each do |mail|
      user.invitations.create :name => mail, :email => mail, :words_from_friend => words_from_friend
    end
  end
end
