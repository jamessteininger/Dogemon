class GuildsController < InheritedResources::Base
  before_filter :authenticate_user!

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

private

def guild_params
  params.require(:guild).permit(:owner_id, :b_public, :name, :description, :element, :imageurl)
end
end

