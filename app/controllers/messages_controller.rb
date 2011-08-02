class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @messages = current_user.messages.limit(10)
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  def new
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(params[:message])
    
    if @message.save
      redirect_to :index
    else
      render 'new'
    end
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy
  end
end
