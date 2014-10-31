class UsersController < ApplicationController
  #before_filter :authenticate_user!
  
  def add_coin
    amount = params[:amount]
    @user = User.find(params[:user_id])
    @user.add_coin(Float(amount))
    redirect_to @user, notice: 'Got coin.'
  end
  
  def make_wallet
    @user = User.find(params[:user_id])
    wallet_id = BlockIo.get_new_address :label => @user.email
    @user.update_attribute(:block_io_wallet_id, wallet_id["data"]["user_id"].to_i)
    redirect_to wallet_path
  end
  
  def withdrawl
    amount = params[:amount]
    address = params[:address]
    BlockIo.withdraw :amounts => amount, :to_addresses => address
  end
  
 # def sell_all
   # @user = User.find(params[:user_id])
  ##  @user.sales.destroy_all
  #  redirect_to @user
 # end
  
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
    @user = User.find(params[:id])
    if (@user.block_io_wallet_id.presence)
    @blockio_balance = BlockIo.get_address_balance label: @user.email
    @blockio_address = BlockIo.get_address_by_label label: @user.email
    end
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
