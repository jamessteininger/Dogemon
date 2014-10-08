class VotableItemsController < ApplicationController
  before_action :set_votable_item, only: [:show, :edit, :update, :destroy]
  
  def upvote
    @votable_item = VotableItem.find(params[:votable_item_id])
    @votable_item.upvote
    redirect_to votable_items_path
  end
  
  def downvote
    @votable_item = VotableItem.find(params[:votable_item_id])
    @votable_item.downvote
    redirect_to votable_items_path
  end

  # GET /votable_items
  # GET /votable_items.json
  def index
    @votable_items = VotableItem.all
  end

  # GET /votable_items/1
  # GET /votable_items/1.json
  def show
  end

  # GET /votable_items/new
  def new
    @votable_item = VotableItem.new
  end

  # GET /votable_items/1/edit
  def edit
  end

  # POST /votable_items
  # POST /votable_items.json
  def create
    @votable_item = VotableItem.new(votable_item_params)

    respond_to do |format|
      if @votable_item.save
        format.html { redirect_to @votable_item, notice: 'Votable item was successfully created.' }
        format.json { render :show, status: :created, location: @votable_item }
      else
        format.html { render :new }
        format.json { render json: @votable_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votable_items/1
  # PATCH/PUT /votable_items/1.json
  def update
    respond_to do |format|
      if @votable_item.update(votable_item_params)
        format.html { redirect_to @votable_item, notice: 'Votable item was successfully updated.' }
        format.json { render :show, status: :ok, location: @votable_item }
      else
        format.html { render :edit }
        format.json { render json: @votable_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votable_items/1
  # DELETE /votable_items/1.json
  def destroy
    @votable_item.destroy
    respond_to do |format|
      format.html { redirect_to votable_items_url, notice: 'Votable item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votable_item
      @votable_item = VotableItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votable_item_params
      params.require(:votable_item).permit(:upvotes, :downvotes, :sumvotes, :imageurl, :name, :description, :worth, :creator_id)
    end
end
