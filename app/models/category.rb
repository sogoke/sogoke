class Category
  include Mongoid::Document
  include Mongoid::Acts::Tree
  acts_as_tree
    
  field :name
  
  validates :name, presence: true, uniqueness: true
end
