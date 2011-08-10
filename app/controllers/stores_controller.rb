class StoresController < ApplicationController

  def show
    @store = Store.find(params[:id])
  end

  def edit
  end

  def update
    if current_store.update_attributes(params[:store])
      redirect_to current_store, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end
end
