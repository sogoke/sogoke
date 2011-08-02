class Message
  include Mongoid::Document
  field :title
  field :sender_id
  field :receiver_id
  field :content
  field :unread, type: Boolean, default: true
  
  attr_accessor :receiver_name
  
  validates :title, presence: true
  validates :content, presence: true
  validates :receiver_id, receiver: true
  
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  
  scope :unread, where(:unread => true)
  
  def read!
    update_attribute(:unread, false)
  end
end
