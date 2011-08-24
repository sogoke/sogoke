class ProductComment < Comment
  belongs_to :product, :foreign_key => "about_id"
  
  def send_notification
    notification! product.user.product_comment_notifications
  end
end