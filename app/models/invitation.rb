class Invitation
  include Mongoid::Document
  
  field :name
  field :email
  field :description
  field :words_from_friend
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email, :case_sensitive => false
  
  def self.send_invitations_to_friends(words_from_friend, friends_mails)
    friends_mails.split("\r\n").each do |mail|
      create :name => mail, :email => mail, :words_from_friend => words_from_friend
    end
  end
end
