class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all.where.not(:b_mod_blocked, true)
  end
  
  def mod_block 
    @item = Item.find(params[:item_id])
    @item.update_attribute(:b_mod_blocked, !@item.b_mod_blocked)
    redirect_to @item 
  end
  
  def grid
    @valid_items = Item.where("b_mod_blocked IS NULL OR b_mod_blocked = ?", false)
    sort_type = params[:sort_type]
    if (sort_type == "Newest")
      @items = @valid_items.paginate(:page => params[:page], :per_page => 16).order('created_at DESC')
    elsif (sort_type == "Oldest")
      @items = @valid_items.paginate(:page => params[:page], :per_page => 16).order('created_at ASC')
    elsif (sort_type == "Most Downloads")
      @items = @valid_items.paginate(:page => params[:page], :per_page => 16).order('downloads DESC')
    elsif (sort_type == "Highest Price")
      @items = @valid_items.paginate(:page => params[:page], :per_page => 16).order('worth DESC')
    elsif (sort_type == "Lowest Price")
      @items = @valid_items.paginate(:page => params[:page], :per_page => 16).order('worth ASC')
    else
      @items = @valid_items.paginate(:page => params[:page], :per_page => 16).order('created_at DESC')
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @user = current_user
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end
  
  def upvote
    @item = Item.find(params[:id])

    if @item.market_item_votes.create(user_id: current_user.id)
      flash[:notice] =  "Thank you for upvoting!"
      redirect_to(items_grid_path)
    else 
      flash[:notice] =  "You have already upvoted this!"
      redirect_to(items_grid_path)
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.update_attribute(:magic, @item.attack * 1.5)
    @item.update_attribute(:worth, @item.attack * 10)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_grid_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:b_original_art, :utility_type, :downloads, :creator_id, :id, :name, :description, :worth, :imageurl, :element, :category, :attack, :magic, :turns, :boost)
    end
end
