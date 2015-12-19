class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def create
    if comment_params[:town_id]
      @town = Town.find(comment_params[:town_id])
      @comment = @town.comments.new(comment_params)
    else
      @comment = Comment.new(comment_params)
    end

    respond_to do |format|
      if @comment.save and comment_params[:town_id]
        format.html { redirect_to @comment.town }
        format.json { render :show, status: :created, location: @town }
      elsif @comment.save
        format.html { redirect_to @comment }
        format.json { render :show, status: :created, location: @town }
      else
        format.html { render :new }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :town_id, :content, :body_html, :body, :upvotes, :downvotes, :guild_id)
    end
end

