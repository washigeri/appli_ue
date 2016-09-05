class Admin::SemestresController < AdminController
  before_action :set_semestre, only: [:edit, :update, :destroy]
  before_action :all_semestre, only: [:index, :create, :update, :destroy]

  def index
    respond_to do |format|
      format.js
    end
  end


  # GET /semestres/new
  def new
    @semestre = Semestre.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /semestres/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js { render :new }
    end
  end

  # POST /semestres
  # POST /semestres.json
  def create
    @semestre = Semestre.new(semestre_params)

    respond_to do |format|
      if @semestre.save
        format.html { redirect_to semestres_url, success: 'Semestre was successfully created.' }
        format.json { render :show, status: :created, location: @semestre }
        format.js
      else
        format.html { render :new }
        format.json { render json: @semestre.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /semestres/1
  # PATCH/PUT /semestres/1.json
  def update
    respond_to do |format|
      if @semestre.update(semestre_params)
        format.html { redirect_to semestres_url, success: 'Semestre was successfully updated.' }
        format.js { render :create }
      else
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end

  # DELETE /semestres/1
  # DELETE /semestres/1.json
  def destroy
    @semestre.destroy
    respond_to do |format|
      format.html { redirect_to semestres_url, success: 'Semestre was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render :index }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_semestre
    @semestre = Semestre.find(params[:id])
  end

  def all_semestre
    @semestres = Semestre.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def semestre_params
    params.require(:semestre).permit(:numero,:year_id)
  end

end