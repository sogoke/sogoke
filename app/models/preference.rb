class Preference
  include Mongoid::Document
  
  field :mail_on_receiving_message, type: Boolean, default: true
  field :mail_on_being_followed, type: Boolean, default: true
  field :message_from_everyone, type: Boolean, default: true
  field :user_id
  
  validates :user_id, presence: true
end
