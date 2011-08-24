class Post
  include Mongoid::Document
  include Mongoid::Taggable
  
  field :title
  field :content
  field :user_id
  
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user
  has_many :comments, :class_name => "PostComment", :foreign_key => "about_id"
  has_many :relationships, :class_name => "PostRelation", :foreign_key => "with_id"
  
  def build_relation(uid = user_id)
    PostRelation.create user_id: uid, with_id: id
  end
end
