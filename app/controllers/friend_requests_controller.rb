class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: %i[destroy accept]

  def index
    @friend_requests = current_user.received_friend_requests
  end

  def create
    @friend_request = FriendRequest.new friend_request_params

    if @friend_request.save
      redirect_to strangers_path, notice: "Friend request has been sent."
    else
      redirect_to strangers_path, alert: "Something went wrong."
    end
  end

  def destroy
    @friend_request.destroy

    redirect_to friend_requests_path, notice: "Friend request has been deleted."
  end

  def accept
    friend = @friend_request.sender
    friend_ship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
    @friend_request.destroy

    if friend_ship.save
      redirect_to friend_requests_path, notice: "Friend request accepted!"
    else
      redirect_to friend_requests_path, alert: "Something went wrong"
    end
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id)
  end
end
