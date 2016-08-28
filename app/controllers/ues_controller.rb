class UesController < ApplicationController
  include UesHelper

  before_action :set_ue, only: :show

  # GET /ues
  # GET /ues.json
  def index
=begin
    if (params[:semestres].present? or params[:lieu].present?)
      @ues = Ue.page(params[:page]).where("semestre_id IN (?)", params[:semestres]).where("lieu IN (?)", params[:lieu]).order(:semestre_id).order(:titre)
      @filters = params
    else
      @ues = Ue.page(params[:page]).order(:semestre_id).order(:titre)
    end
=end

    if params[:semestres].present?
      if params[:lieu].present?
        if params[:filtre_ects].present?
          @ues = Ue.filtre_all(params[:lieu], convert_string_to_nums(params[:filtre_ects]), params[:semestres]).page(params[:page]).order(:semestre_id).order(:titre)
        else
          @ues = Ue.filtre_semestre_and_lieu(params[:semestres], params[:lieu]).page(params[:page]).order(:semestre_id).order(:titre)
        end
      elsif params[:filtre_ects].present?
        @ues = Ue.filtre_semestre_and_ects(params[:semestres],convert_string_to_nums(params[:filtre_ects])).page(params[:page]).order(:semestre_id).order(:titre)
      else
        @ues = Ue.filtre_semestre(params[:semestres]).page(params[:page]).order(:semestre_id).order(:titre)
      end
    elsif params[:lieu].present?
      if params[:filtre_ects].present?
        @ues = Ue.filtre_lieu_and_ects(params[:lieu], convert_string_to_nums(params[:filtre_ects])).page(params[:page]).order(:semestre_id).order(:titre)
      else
        @ues = Ue.filtre_lieu(params[:lieu]).page(params[:page]).order(:semestre_id).order(:titre)
      end
    elsif params[:filtre_ects].present?
      @ues = Ue.filtre_ects(convert_string_to_nums(params[:filtre_ects])).page(params[:page]).order(:semestre_id).order(:titre)
    else
      @ues = Ue.page(params[:page]).order(:semestre_id).order(:titre)
    end
    @filters = params
    if not Ue.all.empty?
      @max_ects = Ue.order(:ects_c).last.ects_c.to_i
      @min_ects = Ue.order(:ects_c).first.ects_c.to_i
    else
      @max_ects = 10
      @min_ects = 0
    end
  end


  # GET /ues/1
  # GET /ues/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CombinePDF.parse(FicheuePdf.new(@ue, true).render)
        pdf.number_pages(location: :bottom, margin_from_height: 0)
        send_data pdf.to_pdf, filename: "ue_#{@ue.id}_#{@ue.titre.first(5)}_#{Time.now.strftime("%d-%m-%Y_%H-%M")}.pdf", type: 'application/pdf'
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ue
      @ue = Ue.find(params[:id])
    end

end
