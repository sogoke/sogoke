class CommentsController < ApplicationController
  before_filter :filter_params, :only => :create
  
  def create
    send "create_#{params[:token]}_comment"
  end

  def destroy
    #Auther or the store/article/product owner could delete comments
  end
  
  protected
  
  def filter_params
    params["#{params[:token]}_comment"][:sogoke_id] = params["#{params[:token]}_id"]
  end
  
  def create_article_comment
    @comment = current_user.article_comments.new(params[:article_comment])
    @article = Article.find(params[:article_id])
    
    if @comment.save
      redirect_to article_path(@article), notice: "Successfully."
    else
      render 'articles/show'
    end
  end
  
  def create_post_comment
    @comment = current_user.post_comments.new(params[:post_comment])
    @post = Post.find(params[:post_id])
    
    if @comment.save
      redirect_to post_path(@post), notice: "Successfully."
    else
      render 'posts/show'
    end
  end
  
  def create_product_comment
    @comment = current_user.product_comments.new(params[:product_comment])
    @product = Product.find(params[:product_id])
    
    if @comment.save
      redirect_to product_path(@product), notice: "Successfully."
    else
      render 'products/show'
    end
  end
  
  def create_store_comment
    @comment = current_user.store_comments.new(params[:store_comment])
    @store = Store.find(params[:store_id])
    
    if @comment.save
      redirect_to store_path(@store), notice: "Successfully."
    else
      render 'stores/show'
    end
  end
end
