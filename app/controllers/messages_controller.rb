class MessagesController < InheritedResources::Base

  private

    def message_params
      params.require(:message).permit(:user_id, :conversation_id, :content, :b_read, :other_id)
    end
end

