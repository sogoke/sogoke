class Favorite
  include Mongoid::Document
  
  field :user_id
  field :favorite_id
  
  validates :user_id, presence: true
  validates :favorite_id, presence: true, uniqueness: {scope: "user_id"}
  
  belongs_to :user
end
