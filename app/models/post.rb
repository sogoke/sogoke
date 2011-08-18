class Post
  include Mongoid::Document
  field :title, :type => String
  field :content, :type => String
  field :user_id, :type => String
end
