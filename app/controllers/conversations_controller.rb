class ConversationsController < ApplicationController

  private

    def conversation_params
      params.require(:conversation).permit(:user_id, :other_id)
    end
end

