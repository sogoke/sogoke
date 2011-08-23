class Relation
  include Mongoid::Document
  
  field :user_id
  field :receiver_id
  
  belongs_to :user
end
