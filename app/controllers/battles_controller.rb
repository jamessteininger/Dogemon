class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  #before_action :find_user
  # GET /battles
  # GET /battles.json
  def ghost_attack
    @battle = Battle.find(params[:battle_id])
    @ghost = Ghost.find(@battle.ghost_id)
    @pet = Pet.find(@battle.pet_id)
    @pet_archetype = Pet.find(@ghost.pet_id)  # MAKE REAL ID
    @potentials = @pet_archetype.sales.select { |r| r.magic <= @ghost.magic}
    @ghost_log = GhostLog.new
    rand_amount = rand(0..4)
    
    if @potentials == nil or @potentials == []
      @ghost_log.update_attribute(:description, 'The enemy had to skip a turn')
      @ghost_log.update_attribute(:pet_id, @ghost.id)
    else
      @sale = @potentials.sample
      @ghost_log.update_attribute(:battle_id, @battle.id)
      @ghost_log.update_attribute(:ghost_id, @battle.ghost_id)
      @ghost_log.update_attribute(:item_id, @sale.item.id)
      @ghost_log.update_attribute(:rand_amount, rand_amount)
      @ghost_log.update_attribute(:utility_type, @sale.item.utility_type)
      utility_type = @sale.item.utility_type
      amount = @sale.item.attack
      magic_amount = @sale.item.magic
      if (utility_type == 'Attack')
        @pet.take_damage(Integer(amount) + rand_amount)
      end
      if (utility_type == 'Drain')
        @pet.take_magic_damage(Integer(amount) + rand_amount)
      end
      if (utility_type == 'Heal')
        @ghost.heal_health(Integer(amount) + rand_amount)
      end
      
      @ghost.use_magic(Integer(magic_amount))
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
    end
    @ghost_log.save
    @battle.update_attribute(:b_pet_turn, 'true')
    redirect_to @battle
  end
  
  def attack_enemy
    amount = params[:amount]
    @battle = Battle.find(params[:battle_id])
    @user = User.find(@battle.user_id)
    @aenemy = @battle.aenemies.first
    @aenemy.take_damage(Integer(amount))
    redirect_to @battle, notice: @user.email + " attacks " + " for " + amount + " damage"
  end
  
  def spawn_aenemy
    @battle = Battle.find(params[:battle_id])
    @aenemy = @battle.aenemies.new
    redirect_to @battle
  end
  
  def index
    @battles = Battle.all
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
    @battle = Battle.find(params[:id])
    @user = User.find(@battle.user_id)
   # @enemy = Pet.find(@battle.enemy_id)
   # @aenemies = @battle.aenemies
    @ghost_logs = @battle.ghost_logs
    if @ghost_logs.any?
      @last_log = @ghost_logs.last
      if @last_log.item_id.presence 
        @last_item = Item.find(@last_log.item_id)
      end
      if @last_log.pet_id.presence 
        @last_pet = Pet.find(@last_log.pet_id)
      end
      if @last_log.ghost_id.presence
        @last_pet = Ghost.find(@last_log.ghost_id)
      end
    end
    #if (@battle.aenemies.any?)
    #  @aenemy = Aenemy.find(@battle.aenemy_id)
   # end
  end

  # GET /battles/new
  def new
    @battle = Battle.new
  end

  # GET /battles/1/edit
  def edit
  end

  # POST /battles
  # POST /battles.json
  def create
    if params[:ghost_pet_id] == 0 or params[:ghost_pet_id] == '0'
      @ghost_archetype = Pet.order("RANDOM()").first
    else
      @ghost_archetype = Pet.find(params[:ghost_pet_id])
    end
    @battle = Battle.new(battle_params)
    @ghost = Ghost.new
    @battle.update_attribute(:ghost_id, @ghost.id)
    @ghost.update_attribute(:name, @ghost_archetype.name)
    @ghost.update_attribute(:imageurl, @ghost_archetype.imageurl)
    @ghost.update_attribute(:element, @ghost_archetype.element)
    @ghost.update_attribute(:user_id, @ghost_archetype.user_id)
    @ghost.update_attribute(:pet_id, @ghost_archetype.id)
    @pet = Pet.find(@battle.pet_id)
    @pet.update_attribute(:health, 100)
    @pet.update_attribute(:magic, 100)
    @ghost.update_attribute(:health, 100)
    @ghost.update_attribute(:magic, 100)
    #now adding copies of pets items to ghost
    @ghost.save
    @battle.ghost = @ghost
    @battle.update_attribute(:b_pet_turn, 'true')
    
     if @pet.against_ghost_losses == nil
       @pet.update_attribute(:against_ghost_losses, 0)
    end
    if @pet.against_ghost_wins == nil
      @pet.update_attribute(:against_ghost_wins, 0)
    end
    if @pet.ghost_losses == nil
     @pet.update_attribute(:ghost_losses, 0)
    end
    if @pet.ghost_wins == nil
      @pet.update_attribute(:ghost_wins, 0)
    end
      
       if Pet.find(@ghost.pet_id).against_ghost_losses == nil
      Pet.find(@ghost.pet_id).update_attribute(:against_ghost_losses, 0)
    end
    if Pet.find(@ghost.pet_id).against_ghost_wins == nil
      Pet.find(@ghost.pet_id).update_attribute(:against_ghost_wins, 0)
    end
    if Pet.find(@ghost.pet_id).ghost_losses == nil
      Pet.find(@ghost.pet_id).update_attribute(:ghost_losses, 0)
    end
    if Pet.find(@ghost.pet_id).ghost_wins == nil
      Pet.find(@ghost.pet_id).update_attribute(:ghost_wins, 0)
    end
    
    respond_to do |format|
      if @battle.save
        Pet.find(@battle.pet_id).update_attribute(:battle_id, @battle.id)
        flash[:notice] = 'Welcome!'
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render :show, status: :created, location: @battle }
      else
        format.html { render :new }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'A new battle has begun! Time to play your first move!' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url, notice: 'Battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_user
      @user = User.find(params[:user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.require(:battle).permit(:user_id, :enemy_id, :pet_id, :b_pet_turn, :battle_state, :b_pet_winner)
    end
end
