class FavoritesController < ApplicationController
  before_filter :find_user, :only => [:stores, :products, :articles]
  
  def stores
  end

  def products
  end
  
  def articles
  end
  
  def create
    favorite = current_user.send("favorite_#{params[:token]}s").create params[:favorite]
    render json: { favorite_id: favorite.id }
  end
  
  def destroy
    favorite = current_user.send("favorite_#{params[:token]}s").find(params[:id])
    sogoke_id = favorite.send("#{params[:token]}").id
    favorite.destroy
    render json: { sogoke_id: sogoke_id }
  end
  
  protected
  def find_user
    @user = User.find(params[:user_id])
  end
end
