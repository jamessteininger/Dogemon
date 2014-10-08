class MarketItemVotesController < ApplicationController
  before_action :set_market_item_vote, only: [:show, :edit, :update, :destroy]

  # GET /market_item_votes
  # GET /market_item_votes.json
  def index
    @market_item_votes = MarketItemVote.all
  end

  # GET /market_item_votes/1
  # GET /market_item_votes/1.json
  def show
  end

  # GET /market_item_votes/new
  def new
    @market_item_vote = MarketItemVote.new
  end

  # GET /market_item_votes/1/edit
  def edit
  end

  # POST /market_item_votes
  # POST /market_item_votes.json
  def create
    @market_item_vote = MarketItemVote.new(market_item_vote_params)

    respond_to do |format|
      if @market_item_vote.save
        format.html { redirect_to @market_item_vote, notice: 'Market item vote was successfully created.' }
        format.json { render :show, status: :created, location: @market_item_vote }
      else
        format.html { render :new }
        format.json { render json: @market_item_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /market_item_votes/1
  # PATCH/PUT /market_item_votes/1.json
  def update
    respond_to do |format|
      if @market_item_vote.update(market_item_vote_params)
        format.html { redirect_to @market_item_vote, notice: 'Market item vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @market_item_vote }
      else
        format.html { render :edit }
        format.json { render json: @market_item_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_item_votes/1
  # DELETE /market_item_votes/1.json
  def destroy
    @market_item_vote.destroy
    respond_to do |format|
      format.html { redirect_to market_item_votes_url, notice: 'Market item vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_item_vote
      @market_item_vote = MarketItemVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_item_vote_params
      params.require(:market_item_vote).permit(:user_id, :item_id)
    end
end
