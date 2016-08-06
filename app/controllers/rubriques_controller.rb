class RubriquesController < ApplicationController
  before_action :set_rubrique, only: [:show, :edit, :update, :destroy]

  # GET /rubriques
  # GET /rubriques.json
  def index
    if params[:cours].present?
      @rubriques = Rubrique.where("cour_id IN (?)", params[:cours]).order(:cour_id).order(:titre)
    else
      @rubriques = Rubrique.order(:cour_id).order(:titre)
    end
  end

  def index_module
    @cour = Cour.find(params[:cour_id])
    @rubriques = @cour.rubriques.order(:titre)
  end

  # GET /rubriques/1
  # GET /rubriques/1.json
  def show
  end

  # GET /rubriques/new
  def new
    @rubrique = Rubrique.new
  end

  # GET /rubriques/1/edit
  def edit
  end

  # POST /rubriques
  # POST /rubriques.json
  def create
    @rubrique = Rubrique.new(rubrique_params)

    respond_to do |format|
      if @rubrique.save
        format.html { redirect_to @rubrique, success: 'Rubrique was successfully created.' }
        format.json { render :show, status: :created, location: @rubrique }
      else
        format.html { render :new }
        format.json { render json: @rubrique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rubriques/1
  # PATCH/PUT /rubriques/1.json
  def update
    respond_to do |format|
      if @rubrique.update(rubrique_params)
        format.html { redirect_to @rubrique, success: 'Rubrique was successfully updated.' }
        format.json { render :show, status: :ok, location: @rubrique }
      else
        format.html { render :edit }
        format.json { render json: @rubrique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubriques/1
  # DELETE /rubriques/1.json
  def destroy
    @rubrique.destroy
    respond_to do |format|
      format.html { redirect_to rubriques_url, success: 'Rubrique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rubrique
      @rubrique = Rubrique.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rubrique_params
      params.require(:rubrique).permit(:titre, :objectif, :contenu, :cour_id)
    end
end
