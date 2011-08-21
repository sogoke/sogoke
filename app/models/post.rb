class Post
  include Mongoid::Document
  include Mongoid::Taggable
  
  field :title
  field :content
  field :user_id
  
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user
  has_many :comments, :class_name => "PostComment", :foreign_key => "sogoke_id"
end
