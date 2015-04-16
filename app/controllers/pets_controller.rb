class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:edit, :uddate, :destroy, :challenge, :index]
  # GET /pets
  # GET /pets.json
  def index
    @pets = current_user.pets.all
  end
  def challenge
    @pet = Pet.find(params[:pet_id])
    @user = @pet.user
    @sales = @user.sales
  end
  # GET /pets/1
  # GET /pets/1.json
  def show
    @pet = Pet.find(params[:id])
    @user = @pet.user
    @sales = @user.sales
  end

  # GET /pets/new
  def new
    @user = current_user
    @pet = @user.pets.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @user = current_user
    @pet = @user.pets.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @user, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @user = @pet.user
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:against_ghost_losses, :against_ghost_wins, :element, :health, :magic, :pvp_battle_id, :imageurl, :name, :description, :user_id, :ghost_wins, :ghost_losses, :player_wins, :player_losses, :favorite_activity, :disposition)
    end
end
