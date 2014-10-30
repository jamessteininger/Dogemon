class PvpBattlesController < ApplicationController
  before_action :set_pvp_battle, only: [:show, :edit, :update, :destroy]

  def apply_regen
    amount = params[:amount]
    @pvp_battle = PvpBattle.find(params[:pvp_battle_id])
    @pvp_battle.apply_regen(Float(amount))
    redirect_to @pvp_battle, notice: 'apply_regen'
  end
  
  def restore_health
    @pvp_battle = PvpBattle.find(params[:pvp_battle_id])
    @pvp_battle.restore_health
    redirect_to @pvp_battle, notice: 'restore_health'
  end
  
  def attack
    amount = params[:amount]
    @battle = Battle.find(params[:battle_id])
    @user = User.find(@battle.user_id)
    @aenemy = @battle.aenemies.first
    @aenemy.take_damage(Integer(amount))
    redirect_to @battle, notice: @user.email + " attacks " + " for " + amount + " damage"
  end
  
  # GET /pvp_battles
  # GET /pvp_battles.json
  def index
    @pvp_battles = PvpBattle.all
  end

  # GET /pvp_battles/1
  # GET /pvp_battles/1.json
  def show
    @pvp_battle = PvpBattle.find(params[:id])
    @battle_logs = @pvp_battle.battle_logs
  end

  # GET /pvp_battles/new
  def new
    @pvp_battle = PvpBattle.new
  end

  # GET /pvp_battles/1/edit
  def edit
  end

  # POST /pvp_battles
  # POST /pvp_battles.json
  def create
    @pvp_battle = PvpBattle.new(pvp_battle_params)
    respond_to do |format|
      if @pvp_battle.save
        Pet.find(@pvp_battle.pet1_id).update_attribute(:pvp_battle_id, @pvp_battle.id)
       # Pet.find(@pvp_battle.pet2_id).update_attribute(:pvp_battle_id, @pvp_battle.id)
        User.find(@pvp_battle.other_id).pvp_battles.new
        format.html { redirect_to @pvp_battle, notice: 'Pvp battle was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_battle }
      else
        format.html { render :new }
        format.json { render json: @pvp_battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_battles/1
  # PATCH/PUT /pvp_battles/1.json
  def update
    respond_to do |format|
      if @pvp_battle.update(pvp_battle_params)
        format.html { redirect_to @pvp_battle, notice: 'Pvp battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_battle }
      else
        format.html { render :edit }
        format.json { render json: @pvp_battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_battles/1
  # DELETE /pvp_battles/1.json
  def destroy
    @pvp_battle.destroy
    respond_to do |format|
      format.html { redirect_to pvp_battles_url, notice: 'Pvp battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_battle
      @pvp_battle = PvpBattle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_battle_params
      params.require(:pvp_battle).permit(:pet1_id, :pet2_id, :winner_id, :user_id, :other_id, :battle_state, :user1_turn)
    end
end
