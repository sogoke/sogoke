class CommentsController < ApplicationController
  before_filter :filter_params, :only => :create
  
  def create
    send "create_#{params[:token]}_comment"
  end

  def destroy
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
  
  def create_product_comment
    @comment = current_user.product_comments.new(params[:product_comment])
    @product = Product.find(params[:product_id])
    
    if @comment.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end
end
