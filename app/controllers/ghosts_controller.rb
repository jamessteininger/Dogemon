class GhostsController < ApplicationController
  before_action :set_ghost, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  
  def index
    @ghosts = current_user.ghosts.all
  end

  def show
    @ghost = Ghost.find(params[:id])
    @user = @ghost.user
    @sales = @user.sales
  end

  def new
    @user = current_user
    @ghost = @user.ghosts.new
  end

  def edit
  end

  def create
    @user = current_user
    @ghost = @user.ghosts.new(pet_params)

    respond_to do |format|
      if @ghost.save
        format.html { redirect_to @user, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @ghost }
      else
        format.html { render :new }
        format.json { render json: @ghost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ghost.update(ghost_params)
        format.html { redirect_to @ghost, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @ghost }
      else
        format.html { render :edit }
        format.json { render json: @ghost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = @ghost.user
    @ghost.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

    def ghost_params
      params.require(:ghost).permit(:item1_id, :item2_id, :item3_id, :item4_id, :pet_id, :name, :health, :magic, :description, :user_id, :element, :imageurl, :battle_id)
    end
end

