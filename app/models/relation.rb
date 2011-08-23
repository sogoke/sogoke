class Relation
  include Mongoid::Document
  
  field :user_id
  field :receiver_id
  
  validates :user_id, presence: true
  validates :receiver_id, presence: true
  
  belongs_to :user
end
