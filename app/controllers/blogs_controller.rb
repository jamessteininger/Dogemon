class BlogsController < ApplicationController
def index
    @blogs = Blog.all
  end
  private

    def blog_params
      params.require(:blog).permit(:user_id, :title, :description)
    end
end

