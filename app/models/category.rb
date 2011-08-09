class Category
  include Mongoid::Document
  recursively_embeds_many
  
  field :name
  
  validates :name, presence: true, uniqueness: true
end
