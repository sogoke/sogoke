class Store
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::Timestamps
  
  field :name
  field :announcement
  field :user_id
  
  belongs_to :user
  has_many :products
  has_many :comments, :class_name => "StoreComment", :foreign_key => "about_id"
end
