class BuzzsController < ApplicationController
  def show
    @buzz = Buzz.find(params[:id])
  end

  def edit
    @buzz = Buzz.find(params[:id])
  end

  def create
    @buzz = Buzz.new(params[:buzz])

    respond_to do |format|
      if @buzz.save
        format.html { redirect_to @buzz, notice: 'Buzz was successfully created.' }
        format.json { render json: @buzz, status: :created, location: @buzz }
      else
        format.html { render action: "new" }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @buzz = Buzz.find(params[:id])

    respond_to do |format|
      if @buzz.update_attributes(params[:buzz])
        format.html { redirect_to @buzz, notice: 'Buzz was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @buzz = Buzz.find(params[:id])
    @buzz.destroy
    
    redirect_to buzzs_url
  end
end
