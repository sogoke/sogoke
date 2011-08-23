class RelationsController < ApplicationController
  def create
    relation = current_user.send("following_#{params[:token]}s").create params[:relation]
    render json: { relation_id: relation.id }
  end
  
  def destroy
    relation = current_user.send("following_#{params[:token]}s").find(params[:id])
    sogoke_id = relation.send("following_#{params[:token]}").id
    relation.destroy
    render json: { sogoke_id: sogoke_id }
  end
end
