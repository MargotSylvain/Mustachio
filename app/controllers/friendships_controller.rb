class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], user_id: params[:user_id] )
    if @friendship.save
      flash[:notice] = "Friend request sent."
      redirect_to friends_url
    else
      flash[:error] = "Unable to request friendship."
      redirect_to friends_url
    end
  end

   def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update(accepted: true)
      if @friendship.save
        redirect_to friends_url, notice: "Successfully confirmed friend!"
      else
        redirect_to friends_url, notice: "Sorry! Could not confirm friend!"
      end
    end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friends_url
  end



end
