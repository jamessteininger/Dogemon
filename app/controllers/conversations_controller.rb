class ConversationsController < InheritedResources::Base

  private

    def conversation_params
      params.require(:conversation).permit(:user_id, :other_id)
    end
end

