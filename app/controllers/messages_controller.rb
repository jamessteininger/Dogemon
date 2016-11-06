class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end
  
  def create
    @message = Message.create! content: params[:message][:content], conversation: @conversation, user: current_user, other: User.find(@conversation.other_id)
  end
  
  private

  def message_params
    params.require(:message).permit(:user_id, :conversation_id, :content, :b_read, :other_id)
  end
end

