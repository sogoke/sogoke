class Tag
  include Mongoid::Document
  
  field :name
  
  validates :name, presence: true, uniqueness: true
end
