class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
  # GET /sales
  # GET /sales.json
  
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @user = User.find(params[:user_id])
    @item = Item.find(params[:user_id])
    @sale = @user.sales.new(sale_params)
  end

  # GET /sales/1/edit
  def edit
  end
  
  def give_booster
    @user = User.find(params[:user_id])
    @item1 = Item.find(rand(0..Item.all.count))
    @item2 = Item.find(rand(0..Item.all.count))
    @item3 = Item.find(rand(0..Item.all.count))
    @item4 = Item.find(rand(0..Item.all.count))
    @item5 = Item.find(rand(0..Item.all.count))
    @sale1 = @user.sales.new(user_id: @user.id, item_id: @item1.id)
    @sale2 = @user.sales.new(user_id: @user.id, item_id: @item2.id)
    @sale3 = @user.sales.new(user_id: @user.id, item_id: @item3.id)
    @sale4 = @user.sales.new(user_id: @user.id, item_id: @item4.id)
    @sale5 = @user.sales.new(user_id: @user.id, item_id: @item5.id)
  end

  # POST /sales
  # POST /sales.json
  def create
    @user = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
    @sale = @user.sales.new(sale_params.merge(item_id: params[:item_id]))
    
    
    
    respond_to do |format|
      if @sale.save
        @item.update_attribute(:downloads, @item.downloads += 1)
        @user.update_attribute(:coin, @user.coin -= @item.worth)
        @creator = User.find(@item.creator_id)
        @creator.update_attribute(:coin_made, @creator.coin_made += (@item.worth.to_f * 0.95))
        @creator.update_attribute(:coin, @creator.coin += @item.worth)
        
        percent_creator = (@item.worth.to_f * 0.95)
        percent_company = (@item.worth.to_f * 0.05)
        pay_to = BlockIo.get_user_address user_id: @creator.block_io_wallet_id
        BlockIo.withdraw_from_user user_id: current_user.block_io_wallet_id, payment_address: pay_to['data']['address'], amount: percent_creator
        
        format.html { redirect_to current_user, notice: 'Paid ' + @item.worth.to_s + ' for ' + @item.name +  ' successfully.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @user = User.find(params[:user_id])
      @sale = Sale.find(params[:id])
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :item_id)
    end
end
