class Comment
  include Mongoid::Document
  
  field :content
  field :about_id
  field :user_id
  
  validates :content, presence: true
  validates :about_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
end
