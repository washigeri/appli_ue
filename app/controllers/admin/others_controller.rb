class Admin::OthersController < AdminController
  before_action :all_others, only: [:index, :create, :update, :destroy]
  before_action :set_other, only: [:edit, :update, :destroy]
  before_action :set_type

  def index
      respond_to do |format|
        format.js
      end
  end

  def new
    @other = type_class.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @other = type_class.new(other_params)
    respond_to do |format|
      if @other.save
        format.js { render :create, status: :created, success: 'Year was successfully created.'}
      else
        format.js {render :new}
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @other.update(other_params)
        format.js {render action: :create}
      else
        format.js { render action: :edit}
      end
    end
  end

  def destroy
    @other.destroy
    respond_to do |format|
      format.js { render action: :index}
    end
  end

  private

  def set_type
    @type = type
  end

  def type
    Other.types.include?(params[:type]) ? params[:type] : "Other"
  end

  def type_class
    type.constantize
  end


  def all_others
    @others = type_class.all
  end

  def set_other
    @other = type_class.find(params[:id])
  end

  def other_params
    params.require(type.underscore.to_sym).permit(:value, :type)
  end

end