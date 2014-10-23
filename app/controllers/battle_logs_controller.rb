class BattleLogsController < ApplicationController
  before_action :set_battle_log, only: [:show, :edit, :update, :destroy]

  # GET /battle_logs
  # GET /battle_logs.json
  def index
    @battle_logs = BattleLog.all
  end

  # GET /battle_logs/1
  # GET /battle_logs/1.json
  def show
  end

  # GET /battle_logs/new
  def new
    @battle_log = @pvp_battle.battle_logs.new
  end

  # GET /battle_logs/1/edit
  def edit
  end

  # POST /battle_logs
  # POST /battle_logs.json
  def create
    amount = params[:amount]
    magic_amount = params[:magic_amount]
    attacker = params[:attacker]
    defender = params[:defender]
    @pvp_battle = PvpBattle.find(params[:pvp_battle_id])
    @pvp_battle.update_attribute(:user1_turn, !@pvp_battle.user1_turn)
    #@user = User.find(@battle.user_id)
   # @aenemy = @battle.aenemies.first
    @pet1 = Pet.find(@pvp_battle.pet1_id)
    @pet2 = Pet.find(@pvp_battle.pet2_id)
    if (attacker.to_i < 2)
      @pet2.take_damage(Integer(amount))
      @pet1.use_magic(Integer(magic_amount))
    elsif (attacker.to_i > 1)
      @pet1.take_damage(Integer(amount))
      @pet2.use_magic(Integer(magic_amount))
    end
    #@pvp_battle.apply_regen(10)
    #@battle = Battle.find(params[:battle_id])
    @battle_log = @pvp_battle.battle_logs.new(battle_log_params)

    respond_to do |format|
      if @battle_log.save
        format.html { redirect_to @pvp_battle, notice: 'Battle log was successfully created.' }
        format.json { render :show, status: :created, location: @battle_log }
      else
        format.html { render :new }
        format.json { render json: @battle_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battle_logs/1
  # PATCH/PUT /battle_logs/1.json
  def update
    respond_to do |format|
      if @battle_log.update(battle_log_params)
        format.html { redirect_to @battle_log, notice: 'Battle log was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle_log }
      else
        format.html { render :edit }
        format.json { render json: @battle_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battle_logs/1
  # DELETE /battle_logs/1.json
  def destroy
    @battle_log.destroy
    respond_to do |format|
      format.html { redirect_to battle_logs_url, notice: 'Battle log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle_log
      @battle_log = BattleLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_log_params
      params.require(:battle_log).permit(:pvp_battle_id, :description, :type, :battle_id)
    end
end
