class FicheyearPdf < Prawn::Document
  def initialize(year)
    super()
    @year = year
    @semestres = @year.semestres.order(:numero)
    header
    table
    font_families.update('Helvetica' => {
        :normal => "#{Rails.root.to_s}/app/pdfs/Helvetica.ttf",
        :bold => "#{Rails.root.to_s}/app/pdfs/Helvetica_bold.ttf",
        :italic => "#{Rails.root.to_s}/app/pdfs/Helvetica_italic.ttf",
    })
  end




  def header
    image "#{Rails.root}/app/assets/images/logo_ensiie.png", width: 70, height: 70, :position => :left
    bounding_box([0,430], width: bounds.width) do
      move_down(10)
      text "Brochure des enseignements de l'année #{@year.value}", :size => 30, style: :bold, :align => :center
      move_down(5)
      transparent(2) { stroke_bounds }
    end
  end

  def table
    start_new_page
    text "Table des matières", size: 20, style: :bold
    move_down(5)
    stroke_horizontal_rule
    move_down(20)
    bounding_box([0, cursor], width: bounds.width) do
      move_down(10)
      indent(5) do
        page_start = 3
        @semestres.each do |semestre|
        text semestre.numero, size: 12, style: :bold
          indent(20) do
            semestre.ues.order(:id).each do |ue|
              y = cursor
              text ue.acronyme, size: 10, style: :italic, align: :left
              temp = page_start + ue.cours.count
              draw_text "p#{page_start} - #{temp}", style: :italic, size: 10, :at => [bounds.right - 45, y]
              page_start = temp + 1
              move_down(5)
            end
            move_down(5)
            stroke_horizontal_rule unless semestre == @semestres.last
            move_down(5)
          end
        end
      end
      transparent(0.5) { stroke_bounds }
    end

  end


end