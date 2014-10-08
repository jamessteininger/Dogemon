class BattleMovesController < ApplicationController
  before_action :set_battle_move, only: [:show, :edit, :update, :destroy]

  # GET /battle_moves
  # GET /battle_moves.json
  def index
    @battle_moves = BattleMove.all
  end

  # GET /battle_moves/1
  # GET /battle_moves/1.json
  def show
  end

  # GET /battle_moves/new
  def new
    @battle_move = BattleMove.new
  end

  # GET /battle_moves/1/edit
  def edit
  end

  # POST /battle_moves
  # POST /battle_moves.json
  def create
    @battle_move = BattleMove.new(battle_move_params)

    respond_to do |format|
      if @battle_move.save
        format.html { redirect_to @battle_move, notice: 'Battle move was successfully created.' }
        format.json { render :show, status: :created, location: @battle_move }
      else
        format.html { render :new }
        format.json { render json: @battle_move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battle_moves/1
  # PATCH/PUT /battle_moves/1.json
  def update
    respond_to do |format|
      if @battle_move.update(battle_move_params)
        format.html { redirect_to @battle_move, notice: 'Battle move was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle_move }
      else
        format.html { render :edit }
        format.json { render json: @battle_move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battle_moves/1
  # DELETE /battle_moves/1.json
  def destroy
    @battle_move.destroy
    respond_to do |format|
      format.html { redirect_to battle_moves_url, notice: 'Battle move was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle_move
      @battle_move = BattleMove.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_move_params
      params.require(:battle_move).permit(:battle_id, :attacker_id, :defender_id, :move_type, :move_amount)
    end
end
