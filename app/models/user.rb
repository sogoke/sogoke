class User
  include Mongoid::Document
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :login
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :login

  field :name
  field :email
  field :invitations_left, type: Integer, default: 5
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id"
  
  def still_have_invitations_left
    invitations_left != 0
  end
  
  
  
  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ :name => login }, { :email => login }).first
  end
end
