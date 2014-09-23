class AenemiesController < ApplicationController
  before_action :set_aenemy, only: [:show, :edit, :update, :destroy]

  # GET /aenemies
  # GET /aenemies.json
  def index
    @aenemies = Aenemy.all
  end

  # GET /aenemies/1
  # GET /aenemies/1.json
  def show
  end

  # GET /aenemies/new
  def new
    @aenemy = @user.aenemies.new
  end

  # GET /aenemies/1/edit
  def edit
  end

  # POST /aenemies
  # POST /aenemies.json
  def create
    @battle = Battle.find(params[:battle_id])
    @aenemy = @battle.aenemies.new(aenemy_params)

    respond_to do |format|
      if @aenemy.save
        format.html { redirect_to @battle, notice: 'Aenemy was successfully created.' }
        format.json { render :show, status: :created, location: @aenemy }
      else
        format.html { render :new }
        format.json { render json: @aenemy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aenemies/1
  # PATCH/PUT /aenemies/1.json
  def update
    respond_to do |format|
      if @aenemy.update(aenemy_params)
        format.html { redirect_to @aenemy, notice: 'Aenemy was successfully updated.' }
        format.json { render :show, status: :ok, location: @aenemy }
      else
        format.html { render :edit }
        format.json { render json: @aenemy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aenemies/1
  # DELETE /aenemies/1.json
  def destroy
    @battle = @aenemy.battle
    @aenemy.destroy
    respond_to do |format|
      format.html { redirect_to @battle, notice: 'Aenemy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aenemy
      @aenemy = Aenemy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aenemy_params
      params.require(:aenemy).permit(:health, :attack, :defense, :element, :coin, :experience, :name, :description, :imageurl, :enemy_id)
    end
end
