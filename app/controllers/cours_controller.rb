class CoursController < ApplicationController
  before_action :set_cour, only: :show

  # GET /cours
  # GET /cours.json
  def index
    if params[:ues].present?
      @cours = Cour.where("ue_id IN (?)", params[:ues]).order(:ue_id).order(:titre)
    else
      @cours = Cour.order(:ue_id).order(:titre)
    end
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
