class Relation
  include Mongoid::Document
  
  field :user_id
  field :with_id
  
  validates :user_id, presence: true
  validates :with_id, presence: true
  
  belongs_to :user
end
