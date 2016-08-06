class CoursController < ApplicationController
  before_action :set_cour, only: [:show, :edit, :update, :destroy]

  # GET /cours
  # GET /cours.json
  def index
    if params[:ues].present?
      @cours = Cour.where("ue_id IN (?)", params[:ues]).order(:ue_id).order(:titre)
    else
      @cours = Cour.order(:ue_id).order(:titre)
    end
  end

  def index_ues
    @ue = Ue.find(params[:ue_id])
    @cours = @ue.cours.order(:titre)
  end

  # GET /cours/1
  # GET /cours/1.json
  def show
  end

  # GET /cours/new
  def new
    @cour = Cour.new
  end

  # GET /cours/1/edit
  def edit
  end

  # POST /cours
  # POST /cours.json
  def create
    @cour = Cour.new(cour_params)

    respond_to do |format|
      if @cour.save
        format.html { redirect_to @cour, success: 'Cour was successfully created.' }
        format.json { render :show, status: :created, location: @cour }
      else
        format.html { render :new }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cours/1
  # PATCH/PUT /cours/1.json
  def update
    respond_to do |format|
      if @cour.update(cour_params)
        format.html { redirect_to @cour, success: 'Cour was successfully updated.' }
        format.json { render :show, status: :ok, location: @cour }
      else
        format.html { render :edit }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cours/1
  # DELETE /cours/1.json
  def destroy
    @cour.destroy
    respond_to do |format|
      format.html { redirect_to cours_url, success: 'Cour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cour
      @cour = Cour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cour_params
      params.require(:cour).permit(:titre, :objectif, :contenu, :genre, :decoupage, :evaluation1, :evaluation2, :coeff, :bibliographie, :ue_id)
    end
end
