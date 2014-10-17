class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def add_coin
    amount = params[:amount]
    @user = User.find(params[:user_id])
    @user.add_coin(Float(amount))
    redirect_to @user, notice: 'Got coin.'
  end
  
  def set_town
   # town = params[:town_id]
    @user = User.find(params[:user_id])
    @user.set_town(params[:town_id])
    redirect_to @user, notice: 'Traveled to '
  end
  
  def destroy
		@user = User.find(params[:id])
		@user.destroy
	end

	def index
		@users = User.all
		@user = current_user
	end
  
  def show
    @blockio = BlockIo.get_user_balance user_id: params[:id]
		@user = User.find(params[:id])
    @sales = @user.sales

	#	if current_user.id == @user.id
			render action: :show
		#elsif current_user.following?(@user)
		#	render action: :show 
		#else
		#	render file: 'public/denied', formats: [:html]
		#end
	end
  
  private 
  def user_params
    params.require(:user).permit(:email, :coin, :health, :total_health, :magic, :attack)
   end
end
