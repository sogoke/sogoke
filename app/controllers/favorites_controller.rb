class FavoritesController < ApplicationController
  before_filter :find_user
  
  def stores
  end

  def products
  end
  
  protected
  def find_user
    @user = User.find(params[:user_id])
  end
end
