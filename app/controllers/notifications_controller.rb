class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.all
  end
  
  def create
    
  end
  
  def show
    
  end


  private

  def notification_params
    params.require(:notification).permit(:user_id, :other_id, :content, :notification_url, :image_url, :b_read)
  end
end

