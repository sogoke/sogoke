class Comment
  include Mongoid::Document
  field :content
  field :sogoke_id
  field :user_id
  
  validates :content, presence: true
  
  belongs_to :user
end
