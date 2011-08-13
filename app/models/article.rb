class Article
  include Mongoid::Document
  include Mongoid::Taggable
  
  field :title
  field :content
  field :user_id
  
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user
end
