class Product
  include Mongoid::Document
  include Mongoid::Taggable
  
  field :name
  field :description
  field :price, :type => Float
  field :sales_link
  field :sales_description
  field :store_id
  
  validates :name, presence: true
  
  belongs_to :store
end
