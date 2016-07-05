class UEsController < ApplicationController
  before_action :set_ue, only: [:show, :edit, :update, :destroy]

  # GET /ues
  # GET /ues.json
  def index
    @ues = Ue.all
  end

  # GET /ues/1
  # GET /ues/1.json
  def show
  end

  # GET /ues/new
  def new
    @ue = Ue.new
  end

  # GET /ues/1/edit
  def edit
  end

  # POST /ues
  # POST /ues.json
  def create
    @ue = Ue.new(ue_params)

    respond_to do |format|
      if @ue.save
        format.html { redirect_to @ue, notice: 'Ue was successfully created.' }
        format.json { render :show, status: :created, location: @ue }
      else
        format.html { render :new }
        format.json { render json: @ue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ues/1
  # PATCH/PUT /ues/1.json
  def update
    respond_to do |format|
      if @ue.update(ue_params)
        format.html { redirect_to @ue, notice: 'Ue was successfully updated.' }
        format.json { render :show, status: :ok, location: @ue }
      else
        format.html { render :edit }
        format.json { render json: @ue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ues/1
  # DELETE /ues/1.json
  def destroy
    @ue.destroy
    respond_to do |format|
      format.html { redirect_to ues_url, notice: 'Ue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ue
      @ue = Ue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ue_params
      params.require(:ue).permit(:titre, :description, :type, :lieu)
    end
end
