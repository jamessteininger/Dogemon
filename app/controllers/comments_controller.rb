class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:user_id, :town_id, :content, :body_html, :body, :upvotes, :downvotes, :guild_id)
    end
end

