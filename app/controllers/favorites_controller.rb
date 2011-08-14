class FavoritesController < ApplicationController
  before_filter :find_user, :only => [:stores, :products]
  
  def stores
  end

  def products
  end
  
  def create
    @favorite = current_user.send("favorite_#{params[:token]}s").create params[:favorite]
    render json: { favorite_id: @favorite.id }
  end
  
  def destroy
    @favorite = current_user.send("favorite_#{params[:token]}s").find(params[:id])
    @favorite.destroy
    render json: { sogoke_id: @favorite.send("#{prams[:token]}").id }
  end
  
  protected
  def find_user
    @user = User.find(params[:user_id])
  end
end
