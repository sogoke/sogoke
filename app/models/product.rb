class Product
  include Mongoid::Document
  
  field :name
  field :description
  field :price, :type => Float
  field :sales_link
  field :sales_description
  field :user_id
  
  belongs_to :user
end
