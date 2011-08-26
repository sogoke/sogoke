class RelationsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    relation = current_user.send("following_#{params[:token]}s").create params[:relation]
    render json: { relation_id: relation.id }
  end
  
  def destroy
    relation = current_user.send("following_#{params[:token]}s").find(params[:id])
    with_id = relation.send("following_#{params[:token]}").id
    relation.destroy
    render json: { sogoke_id: with_id }
  end
end
