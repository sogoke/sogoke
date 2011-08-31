class Preference
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::Timestamps
  
  field :mail_on_receiving_message, type: Boolean, default: true
  field :mail_on_being_followed, type: Boolean, default: true
  field :message_from_everyone, type: Boolean, default: true
  field :user_id
  field :invitations_left, type: Integer, default: 5
  field :gender
  field :website
  field :aboutme
  
  validates :user_id, presence: true
  
  belongs_to :user
end
