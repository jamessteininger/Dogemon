class BlogsController < InheritedResources::Base

  private

    def blog_params
      params.require(:blog).permit(:user_id, :title, :description)
    end
end

