class Admin::UesController < AdminController
  before_action :set_ue, only: [ :edit, :update, :destroy]
  before_action :all_ues, only: [:index, :create, :update, :destroy]

  def index
    respond_to do |format|
      format.js
    end
  end

  def new
    @ue = Ue.new
    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /ues/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js {render :new }
    end
  end

  # POST /ues
  # POST /ues.json
  def create
    @ue = Ue.new(ue_params)

    respond_to do |format|
      if @ue.save
        format.html { redirect_to @ue, success: 'Ue was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @ue.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /ues/1
  # PATCH/PUT /ues/1.json
  def update
    respond_to do |format|
      if @ue.update(ue_params)
        format.html { redirect_to @ue, success: 'Ue was successfully updated.' }
        format.js { render :create }
      else
        format.html { render :edit }
        format.json { render json: @ue.errors, status: :unprocessable_entity }
        format.js {render :new }
      end
    end
  end

  # DELETE /ues/1
  # DELETE /ues/1.json
  def destroy
    @ue.destroy
    respond_to do |format|
      format.html { redirect_to ues_url, success: 'Ue was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :index }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ue
    @ue = Ue.find(params[:id])
  end

  def all_ues
    @ues = Ue.all.order(:id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ue_params
    params.require(:ue).permit(:acronyme, :year_id, :titre, :objectif, :lieu, :prerequis, :semestre_id, cours_attributes: [:titre, :objectif, :ects, :contenu, :genre, :decoupage, :evaluation1, :evaluation2, :coeff, :bibliographie, :_destroy, :id, :year_id])
  end
end
