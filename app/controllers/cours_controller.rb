class CoursController < ApplicationController
  before_action :set_cour, only: :show

  # GET /cours
  # GET /cours.json
  def index
      if params[:ues].present?
        if params[:genres].present?
          @cours = Cour.both(params[:genres], params[:ues]).page(params[:page]).order(:ue_id).order(:titre)
        else
          @cours = Cour.ue(params[:ues]).page(params[:page]).order(:ue_id).order(:titre)
        end
      else
        if params[:genres].present?
          @cours = Cour.genre(params[:genres]).page(params[:page]).order(:ue_id).order(:titre)
        else
          ues = Ue.year(@year)
          @cours = Cour.year(ues).page(params[:page]).order(:ue_id).order(:titre)
        end
      end
      @filters = params
  end


  # GET /cours/1
  # GET /cours/1.json
  def show
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cour
    @cour = Cour.find(params[:id])
  end
end
