class ArticlesController < ApplicationController
  
  def index
    @articles = User.find(params[:user_id]).articles.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.new
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def create
    @article = current_user.articles.new(params[:article])

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new 
    end
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    
    redirect_to user_articles_path(current_user), notice: "Article was successfully deleted."
  end
end
