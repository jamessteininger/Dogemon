class GuildsController < ApplicationController
  before_filter :authenticate_user!
  def move_guild 
    redirect_to full_game_path
  end

  def new
    @guild = Guild.new
  end

  def show
    @guild = Guild.find(params[:id])
    @guild_battles = @guild.battles
    @guild_battles.order('created_at ASC').reverse
  end

  def index
    if params[:search]
      @guilds = Guild.where(['name LIKE ?', "%#{params[:search]}%"]).paginate(:page => params[:page], :per_page => 30).order('name ASC')
    else
      @guilds = Guild.paginate(:page => params[:page], :per_page => 30).order('name ASC')
    end
  end
  
  def create
    @guild = Guild.new(guild_params)

    respond_to do |format|
      if @guild.save
        format.html { redirect_to @guild, notice: 'Guild was successfully created.' }
        format.json { render :show, status: :created, location: @guild }
      else
        format.html { render :new }
        format.json { render json: @guild.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def guild_params
    params.require(:guild).permit(:owner_id, :b_public, :name, :description, :element, :imageurl)
  end
end

