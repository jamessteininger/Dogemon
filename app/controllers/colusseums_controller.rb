class ColusseumsController < ApplicationController
  before_action :set_colusseum, only: [:show, :edit, :update, :destroy]

  # GET /colusseums
  # GET /colusseums.json
  def index
    @colusseums = Colusseum.all
  end

  # GET /colusseums/1
  # GET /colusseums/1.json
  def show
  end

  # GET /colusseums/new
  def new
    @colusseum = Colusseum.new
  end

  # GET /colusseums/1/edit
  def edit
  end

  # POST /colusseums
  # POST /colusseums.json
  def create
    @colusseum = Colusseum.new(colusseum_params)

    respond_to do |format|
      if @colusseum.save
        format.html { redirect_to @colusseum, notice: 'Colusseum was successfully created.' }
        format.json { render :show, status: :created, location: @colusseum }
      else
        format.html { render :new }
        format.json { render json: @colusseum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colusseums/1
  # PATCH/PUT /colusseums/1.json
  def update
    respond_to do |format|
      if @colusseum.update(colusseum_params)
        format.html { redirect_to @colusseum, notice: 'Colusseum was successfully updated.' }
        format.json { render :show, status: :ok, location: @colusseum }
      else
        format.html { render :edit }
        format.json { render json: @colusseum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colusseums/1
  # DELETE /colusseums/1.json
  def destroy
    @colusseum.destroy
    respond_to do |format|
      format.html { redirect_to colusseums_url, notice: 'Colusseum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colusseum
      @colusseum = Colusseum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colusseum_params
      params.require(:colusseum).permit(:name, :description)
    end
end
