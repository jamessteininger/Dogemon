class ConversationsController < ApplicationController

  def new
    @conversation = Conversation.new
  end
  
  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
  end
  
  def index
    @conversations = Conversation.all
  end
  
  def create
    @user = User.find(params[:conversation][:user_id])
    @conversation = @user.conversations.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def conversation_params
      params.require(:conversation).permit(:user_id, :other_id)
    end
end

