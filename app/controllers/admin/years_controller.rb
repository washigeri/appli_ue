class Admin::YearsController < AdminController
  before_action :set_year, only: [:edit, :update, :destroy]
  before_action :all_years, only: [:index, :create, :update, :destroy]

  def index
    respond_to do |format|
      format.js
    end
  end


  def new
    @year = Year.new
    respond_to do |format|
      format.js
    end
  end

  def create
    if year_params[:copy] == 1
      @year = Year.find(year_params[:copy_from]).amoeba_dup
      @year.value = year_params[:value]
    else
      @year = Year.new(year_params)
    end
     respond_to do |format|
       if @year.save
          format.js { render :create, status: :created, success: 'Year was successfully created.'}
       else
         format.js {render :new}
       end
     end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @year.update(year_params)
        format.js {render :create, success: 'Year was successfully updated.' }
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @year.destroy
    respond_to do |format|
      format.js { render :index, success: 'Year was successfully destroyed.'}
    end

  end

  private

  def all_years
    @years = Year.order(:value)
  end

  def set_year
    @year = Year.find(params[:id])
  end

  def  year_params
    params.require(:year).permit(:value, :copy, :copy_from)
  end

end