class CategoriesController < ApplicationController
  def index
    @categories = Category.roots
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render action: "new"
    end
  end
  
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
end
