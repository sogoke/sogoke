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
  validates :store_id, presence: true
  
  belongs_to :store
  has_many :comments, :class_name => "ProductComment", :foreign_key => "sogoke_id"
  #has_many :favorite_products, :class_name => "FavoriteProduct", :foreign_key => "favorite_id"
end
