class Invitation
  include Mongoid::Document
  
  field :name
  field :email
  field :description
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email, :case_sensitive => false
  
end
