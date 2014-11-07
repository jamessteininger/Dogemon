class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [:wallet, :spirits, :user_home]
  
   def user_home
     @user = current_user
     if (@user.block_io_wallet_id.presence)
       @blockio = BlockIo.get_user_balance user_id: @user.block_io_wallet_id
    # @blockio_address = BlockIo.get_address_by_label label: @user.email
     end
   end
  
  def leaderboard
    Pet.each do |f|
      if f.ghost_wins == nil 
        f.update_attribute(:ghost_wins, 0)
      end
      if f.ghost_losses == nil 
        f.update_attribute(:ghost_losses, 0)
      end
    end
    @top_doge = Pet.order('ghost_wins DESC').limit(10)
  end
  
  def wallet
    @user = current_user 
    if (@user.block_io_wallet_id.presence)
      @blockio = BlockIo.get_user_balance user_id: @user.block_io_wallet_id
  #  @blockio_address = BlockIo.get_address_by_label label: @user.email
    end
  end
  
  def roadmap
    
  end
  
  def index
  end
  
  def how_to_play
  end
  
  def home
   # if user_signed_in?
 #   @user = current_user
  #  @blockio = BlockIo.get_user_balance user_id: @user.id
   # end
  end
  
  def spirits
    @user = current_user
  end
end
