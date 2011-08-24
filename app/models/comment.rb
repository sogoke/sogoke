class Comment
  include Mongoid::Document
  
  field :content
  field :about_id
  field :user_id
  
  validates :content, presence: true
  validates :about_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  
  def notification!(notifications)
    notifications.find_or_initialize_by(about_id: about_id, status: false).combine(user_id)
  end
end
