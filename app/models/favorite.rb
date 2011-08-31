class Favorite
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id
  field :about_id
  
  validates :user_id, presence: true
  validates :about_id, presence: true
  
  belongs_to :user
end
