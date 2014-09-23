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
    @battle_log = @battle.battle_logs.new
  end

  # GET /battle_logs/1/edit
  def edit
  end

  # POST /battle_logs
  # POST /battle_logs.json
  def create
    amount = params[:amount]
    @battle = Battle.find(params[:battle_id])
    #@user = User.find(@battle.user_id)
    @aenemy = @battle.aenemies.first
    @aenemy.take_damage(Integer(amount))
    #@battle = Battle.find(params[:battle_id])
    @battle_log = @battle.battle_logs.new(battle_log_params)

    respond_to do |format|
      if @battle_log.save
        format.html { redirect_to @battle, notice: 'Battle log was successfully created.' }
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
      params.require(:battle_log).permit(:description, :type, :battle_id)
    end
end
