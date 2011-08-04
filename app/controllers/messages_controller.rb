class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @messages = current_user.received_messages.limit(10)
  end

  def show
    @message = current_user.received_messages.find(params[:id])
    @message.read!
  end

  def new
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(params[:message])
    
    if @message.save
      redirect_to :action => :index, :notice => I18n.t("creation_successful")
    else
      render 'new'
    end
  end

  def destroy
    @message = current_user.received_messages.find(params[:id])
    @message.destroy
  end
end
