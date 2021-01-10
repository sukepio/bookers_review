class RelationshipsController < ApplicationController
  
  
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    redirect_to request.referer
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end
  
end
