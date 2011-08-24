class Notification
  include Mongoid::Document
  
  field :user_id
  field :about_id
  field :from_id
  field :status, type: Boolean, default: false
  field :number, type: Integer, default: 0
  
  validates :user_id, presence: true
  
  belongs_to :user
  belongs_to :from, :class_name => "User", :foreign_key => "from_id"
  
  scope :unread, where(status: false)
  
  def combine(user_id)
    update_attributes from_id: user_id, number: number + 1
  end
end
