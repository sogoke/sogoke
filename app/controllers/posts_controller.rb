class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = current_user.post_comments.new
  end

  def new
    @post = current_user.posts.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.new(params[:post])

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end
end
