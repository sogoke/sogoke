class Favorite
  include Mongoid::Document
  
  field :user_id
  field :favorite_id
  
  validates :user_id, presence: true
  validates :favorite_id, presence: true  
  
  belongs_to :user
end
