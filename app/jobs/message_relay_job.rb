class MessageRelayJob < ApplicationJob
  def perform(Message)
    ActionCable.server.broadcast "conversations:#{message.conversation_id}:messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: message })
  end
end