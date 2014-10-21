class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [:wallet, :spirits, :user_home]
  
   def user_home
     @user = current_user
   end
  
  def wallet
    @user = current_user 
    @blockio = BlockIo.get_user_balance user_id: @user.id
  end
  
  def index
  end
  
  def how_to_play
  end
  
  def home
  end
  
  def spirits
    @user = current_user
  end
end
