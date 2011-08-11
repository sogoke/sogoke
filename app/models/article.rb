class Article
  include Mongoid::Document
  
  field :title
  field :content
  field :user_id
  
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user
end
