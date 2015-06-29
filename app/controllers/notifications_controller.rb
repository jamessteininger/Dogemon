class NotificationsController < InheritedResources::Base

  private

    def notification_params
      params.require(:notification).permit(:user_id, :other_id, :content, :notification_url, :image_url, :b_read)
    end
end

