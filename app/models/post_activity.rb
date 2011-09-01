class PostActivity < Activity
  belongs_to :post, :foreign_key => "about_id"
end