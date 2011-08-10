class User
  include Mongoid::Document
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :login
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :login

  field :name
  field :email
  field :invitations_left, type: Integer, default: 5
  field :gender
  field :website
  field :signature
  field :aboutme
  key :name
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email_format: true
  
  has_one :store
  has_many :favorite_stores, :class_name => "FavoriteStore"
  has_many :favorite_products, :class_name => "FavoriteProduct"
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  
  def still_have_invitations_left
    !invitations_left.zero?
  end
  
  def favorite_of?(something)
    !send("favorite_#{something.class.to_s.downcase}s").where(favorite_id: something.id).count.zero?
  end
  
  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ :name => login }, { :email => login }).first
  end
end
