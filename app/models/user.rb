class User
  include Mongoid::Document
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :login
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :login

  field :name
  field :email
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email_format: true
  
  has_one :store
  has_one :preference
  has_many :articles
  has_many :posts
  has_many :favorite_stores, :class_name => "FavoriteStore"
  has_many :favorite_products, :class_name => "FavoriteProduct"
  has_many :favorite_articles, :class_name => "FavoriteArticle"
  has_many :article_comments, :class_name => "ArticleComment"
  has_many :product_comments, :class_name => "ProductComment"
  has_many :store_comments, :class_name => "StoreComment"
  has_many :post_comments, :class_name => "PostComment"
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  
  def still_have_invitations_left
    preference.invitations_left.zero?
  end
  
  def favorite_of?(something)
    !send("favorite_#{something.class.to_s.downcase}s").where(favorite_id: something.id).blank?
  end
  
  %w{mail_on_receiving_message mail_on_being_followed message_from_everyone}.each do |pref|
    define_method "allow_#{pref}?" do
      preference.send(pref)
    end
  end
  
  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ :name => login }, { :email => login }).first
  end
end
