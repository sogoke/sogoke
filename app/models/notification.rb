class Notification
  include Mongoid::Document
  
  field :user_id
  field :sogoke_id
  field :status, type: Boolean, default: false
  field :number, type: Integer, default: 0
  
  validates :user_id, presence: true
  validates :sogoke_id, presence: true
  
  belongs_to :user
  
  scope :unread, where(status: false)
end
