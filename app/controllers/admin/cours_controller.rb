class Admin::CoursController < AdminController
  before_action :set_cour, only: [:edit, :update, :destroy]
  before_action :all_cour, only: [:index, :create, :update, :destroy]

  def index
    respond_to do |format|
      format.js
    end
  end

  # GET /cours/new
  def new
    @cour = Cour.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /cours/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /cours
  # POST /cours.json
  def create
    @cour = Cour.new(cour_params)

    respond_to do |format|
      if @cour.save
        format.html { redirect_to @cour, success: 'Cour was successfully created.' }
        format.json { render :show, status: :created, location: @cour }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
        format.js { render :new }
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
        format.js { render :create}
      else
        format.html { render :edit }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
        format.js { render :new }
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
      format.js { render :index }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cour
    @cour = Cour.find(params[:id])
  end

  def all_cour
    @cours = Cour.all.order(:id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cour_params
    params.require(:cour).permit(:year_id, :titre, :objectif, :ects, :contenu, :genre, :decoupage, :evaluation1, :evaluation2, :coeff, :bibliographie, :ue_id)
  end

end