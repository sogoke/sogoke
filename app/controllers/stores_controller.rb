class StoresController < ApplicationController

  def show
    @store = Store.find(params[:id])
    @comment = current_user.store_comments.new
  end

  def edit
  end

  def update
    if current_store.update_attributes(params[:store])
      redirect_to edit_store_path, notice: 'Store was successfully updated.'
    else
      redirect_to edit_store_path
    end
  end
end
