class YearsController < ApplicationController
  def set_year
    if params[:year].present? and not params[:year].nil?
      cookies.encrypted.permanent[:year] = Year.find(params[:year])
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    respond_to do |format|
      format.html {redirect_to :back}
      format.pdf do
        pdf = CombinePDF.parse(FicheyearPdf.new(@year).render)
        @year.semestres.each do |semestre|
          semestre.ues.each do |ue|
            pdf << CombinePDF.parse(FicheuePdf.new(ue,false, true).render)
          end
        end
        pdf.number_pages(location: :bottom, margin_from_height: 0)
        send_data pdf.to_pdf, filename: "brochure_enseignements_#{@year.value}.pdf", type: 'application/pdf'
      end
    end
  end


end
