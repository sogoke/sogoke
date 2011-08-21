class Comment
  include Mongoid::Document
  
  field :content
  field :sogoke_id
  field :user_id
  
  validates :content, presence: true
  validates :sogoke_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
end
