class MessagesController < ApplicationController
  def index
    @message = Message.new
    @rooms = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id)
  end
end
