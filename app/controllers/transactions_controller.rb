class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
    respond_with(@transactions)
  end
  
  def send_doge
    amount = params[:amount]
    address = params[:address]
    @user = User.find(params[:user_id])
    my_address = BlockIo.get_user_address user_id: @user.block_io_wallet_id
    BlockIo.withdraw_from_user user_id: @user.block_io_wallet_id, payment_address: address.to_s, amount: amount.to_i
    redirect_to wallet_path
  end

  def show
    respond_with(@transaction)
  end

  def new
    @user = current_user
    @transaction = @user.transactions.new
    respond_with(@transaction)
  end

  def edit
  end

  def create
    @user = current_user
    @transaction = @user.transactions.new(transaction_params)
    my_address = BlockIo.get_user_address user_id: @user.block_io_wallet_id
    BlockIo.withdraw_from_user user_id: @user.block_io_wallet_id, payment_address: @transaction.address, amount: @transaction.amount
    
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to wallet_path, notice: 'Success!' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transaction.update(transaction_params)
    respond_with(@transaction)
  end

  def destroy
    @transaction.destroy
    respond_with(@transaction)
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:user_id, :address, :amount)
    end
end
