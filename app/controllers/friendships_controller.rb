class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to users_path, notice: 'Success!' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end

