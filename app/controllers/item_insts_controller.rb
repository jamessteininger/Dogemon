class ItemInstsController < ApplicationController
  before_action :set_item_inst, only: [:show, :edit, :update, :destroy]

  # GET /item_insts
  # GET /item_insts.json
  def index
    @item_insts = ItemInst.all
  end

  # GET /item_insts/1
  # GET /item_insts/1.json
  def show
  end

  # GET /item_insts/new
  def new
    @item_inst = ItemInst.new
  end

  # GET /item_insts/1/edit
  def edit
  end

  # POST /item_insts
  # POST /item_insts.json
  def create
    @item_inst = ItemInst.new(item_inst_params)

    respond_to do |format|
      if @item_inst.save
        format.html { redirect_to @item_inst, notice: 'Item inst was successfully created.' }
        format.json { render :show, status: :created, location: @item_inst }
      else
        format.html { render :new }
        format.json { render json: @item_inst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_insts/1
  # PATCH/PUT /item_insts/1.json
  def update
    respond_to do |format|
      if @item_inst.update(item_inst_params)
        format.html { redirect_to @item_inst, notice: 'Item inst was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_inst }
      else
        format.html { render :edit }
        format.json { render json: @item_inst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_insts/1
  # DELETE /item_insts/1.json
  def destroy
    @item_inst.destroy
    respond_to do |format|
      format.html { redirect_to item_insts_url, notice: 'Item inst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_inst
      @item_inst = ItemInst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_inst_params
      params.require(:item_inst).permit(:item_id, :user_id)
    end
end
