class RelationshipsController < ApplicationController
  respond_to? :js
  def create
    if user_signed_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      flash[:notice] = "フォローしました"
    end  
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    flash[:notice] = "フォロー削除しました"
  end
end
