class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  
  validates :name, presence: true, uniqueness: true
end
