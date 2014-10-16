class StaticPagesController < ApplicationController
  before_filter :authenticate_user!
  
  def wallet
    @user = current_user 
    @blockio = BlockIo.get_user_balance user_id: @user.id
  end
  
  def index
  end
  
  def home
  end
  
  def spirits
    @user = current_user
  end
end
