class ProductCommentNotification < Notification
  belongs_to :product_comment, :foreign_key => "about_id"
  
  def from_path
    product_path(product_comment.product)
  end
end