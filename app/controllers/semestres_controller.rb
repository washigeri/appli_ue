class SemestresController < ApplicationController
  before_action :set_semestre, only: [:show]

  # GET /semestres
  # GET /semestres.json
  def index
    @semestres = Semestre.order(:numero)
  end

  # GET /semestres/1
  # GET /semestres/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CombinePDF.parse(FichesemestrePdf.new(@semestre).render)
        @semestre.ues.each do |ue|
          pdf << CombinePDF.parse(FicheuePdf.new(ue, false).render)
        end
        pdf.number_pages(:location => :bottom, :margin_from_height => 0)
        send_data pdf.to_pdf, filename: "semestre_#{@semestre.id}_#{@semestre.numero}_#{Time.now.strftime("%d-%m-%Y_%H-%M")}.pdf", type: 'application/pdf'
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semestre
      @semestre = Semestre.find(params[:id])
    end
end
