class Store
  include Mongoid::Document
  
  field :name
  field :announcement
  field :user_id
  
  belongs_to :user
  has_many :products
  has_many :comments, :class_name => "StoreComment", :foreign_key => "sogoke_id"
end
