class Invitation
  include Mongoid::Document
  
  field :name
  field :email
  field :description
  field :words_from_friend
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  def self.send_invitations_to_friends(words_from_friend, friends_mails)
    friends_mails.split("\r\n").each do |mail|
      create :name => mail, :email => mail, :words_from_friend => words_from_friend
    end
  end
end
