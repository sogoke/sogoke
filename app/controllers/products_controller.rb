class ProductsController < ApplicationController
  #before_filter :authenticate_user!
  
  def index
    @products = current_user.products.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.new
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def create
    @product = current_user.products.new(params[:product])

    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render "new"
    end
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render "edit"
    end
  end

#  def destroy
#    @product = Product.find(params[:id])
#    @product.destroy

#    respond_to do |format|
#     format.html { redirect_to products_url }
#      format.json { head :ok }
#    end
#  end
end
