class Article
  include Mongoid::Document
  include Mongoid::Taggable
  
  field :title
  field :content
  field :user_id
  
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :comments, :class_name => "ArticleComment", :foreign_key => "about_id"
  #has_many :favorite_articles, :class_name => "FavoriteArticle", :foreign_key => "favorite_id"
end
