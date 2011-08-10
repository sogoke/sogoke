class Product
  include Mongoid::Document
  
  field :name
  field :description
  field :price, :type => Float
  field :sales_link
  field :sales_description
  field :store_id
  
  belongs_to :store
end
