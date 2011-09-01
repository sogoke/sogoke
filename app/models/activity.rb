class Activity
  include Mongoid::Document
  field :user_id
  field :about_id
  
  belongs_to :user
end
