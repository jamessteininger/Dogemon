class GhostLogsController < ApplicationController
  before_action :set_ghost_log, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @ghost_logs = GhostLog.all
  end

  def show
  end

  def new
    @ghost_log = @battle.ghost_logs.new
  end

  def edit
  end

  def create
    @battle = Battle.find(params[:battle_id])
    @pet = Pet.find(@battle.pet_id)
    @ghost = Ghost.find(@battle.ghost_id)
    amount = params[:amount]
    utility_type = params[:utility_type]
    magic_amount = params[:magic_amount]
    attacker = params[:attacker]
    defender = params[:defender]
    @battle.update_attribute(:b_pet_turn, 'false')
    #@user = User.find(@battle.user_id)
    # @aenemy = @battle.aenemies.first
    if (attacker.to_i < 2)
      if (utility_type == 'Attack')
        @ghost.take_damage(Integer(amount))
      end
      if (utility_type == 'Drain')
        @ghost.take_magic_damage(Integer(amount))
      end
      if (utility_type == 'Heal')
        @pet.heal_health(Integer(amount))
      end
      @pet.use_magic(Integer(magic_amount))
    elsif (attacker.to_i > 1)
      if (utility_type == 'Attack')
        @pet.take_damage(Integer(amount))
      end
      if (utility_type == 'Drain')
        @pet.take_magic_damage(Integer(amount))
      end
      if (utility_type == 'Heal')
        @ghost.heal_health(Integer(amount))
      end
      @ghost.use_magic(Integer(magic_amount))
    end
    
    if (@battle.pet.health <= 0)
        @battle.update_attribute(:b_pet_winner, false)
        @battle.update_attribute(:battle_state, "completed")
        @pet.update_attribute(:against_ghost_losses, @pet.against_ghost_losses + 1)
        Pet.find(@ghost.pet_id).update_attribute(:ghost_wins, Pet.find(@ghost.pet_id).ghost_wins + 1)
        @pet.update_attribute(:battle_id, nil)
      elsif (@battle.ghost.health <= 0)
        @battle.update_attribute(:b_pet_winner, true)
        @battle.update_attribute(:battle_state, "completed")
        Pet.find(@ghost.pet_id).update_attribute(:ghost_losses, Pet.find(@ghost.pet_id).ghost_losses + 1)
        @pet.update_attribute(:against_ghost_wins, @pet.against_ghost_wins + 1)
        Pet.find(@battle.pet_id).update_attribute(:battle_id, nil)
      else
        @battle.apply_regen(10)
      end
    #@battle = Battle.find(params[:battle_id])
    @ghost_log = @battle.ghost_logs.new(ghost_log_params)

    respond_to do |format|
      if @ghost_log.save
        @ghost_log.update_attribute(:user_id, params[:user_id])
        format.html { redirect_to @battle }
        format.json { render :show, status: :created, location: @ghost_log }
      else
        format.html { render :new }
        format.json { render json: @ghost_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ghost_log.update(ghost_log_params)
        format.html { redirect_to @battle, notice: 'Battle log was successfully updated.' }
        format.json { render :show, status: :ok, location: @ghost_log }
      else
        format.html { render :edit }
        format.json { render json: @ghost_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ghost_log.destroy
    respond_to do |format|
      format.html { redirect_to ghost_logs_url, notice: 'Battle log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ghost_log
      @ghost_log = BattleLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ghost_log_params
      params.require(:ghost_log).permit(:battle_id, :description, :utility_type, :bMessage, :user_id, :pet_id, :item_id)
    end
end
