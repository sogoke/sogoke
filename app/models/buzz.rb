class Buzz
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content
  field :user_id
  
  validates :content, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :comments, :class_name => "BuzzComment", :foreign_key => "about_id"
  has_many :relationships, :class_name => "BuzzRelation", :foreign_key => "with_id"
  
  def build_relation(uid = user_id)
    BuzzRelation.create user_id: uid, with_id: id
  end
end
