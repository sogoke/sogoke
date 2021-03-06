class BuzzsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  
  def show
    @buzz = Buzz.find(params[:id])
  end

  def edit
    @buzz = current_user.buzzs.find(params[:id])
  end

  def create
    @buzz = current_user.buzzs.new(params[:buzz])

    if @buzz.save
      redirect_to root_path, notice: 'Buzz was successfully created.'
    else
      render "home/index"
    end
  end

  def update
    @buzz = current_user.buzzs.find(params[:id])

    if @buzz.update_attributes(params[:buzz])
      redirect_to @buzz, notice: 'Buzz was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @buzz = current_user.buzzs.find(params[:id])
    @buzz.destroy
    
    redirect_to buzzs_url
  end
end
