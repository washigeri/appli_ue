class FichesemestrePdf < Prawn::Document

  def initialize(semestre)
    super()
    @semestre = semestre
    @ues = @semestre.ues.order(:id)
    header
    body
    font_families.update('Helvetica' => {
        :normal => "#{Rails.root.to_s}/app/pdfs/Helvetica.ttf",
        :bold => "#{Rails.root.to_s}/app/pdfs/Helvetica_bold.ttf",
        :italic => "#{Rails.root.to_s}/app/pdfs/Helvetica_italic.ttf",
    })
  end


  def header
    image "#{Rails.root}/app/assets/images/logo_ensiie.png", width: 70, height: 70, :position => :left
    text "Unités d'Enseignement du #{@semestre.numero}", :size => 20, style: :bold, :align => :center
  end

  def body
    move_down(50)
    stroke_horizontal_rule
    move_down(20)
    text "Table des matières", size: 17, style: :bold, :align => :center
    move_down(10)
    bounding_box([0,cursor], width: bounds.width) do
       move_down(5)
       indent(10) do
         page_start = 2
         @ues.each do |ue|
           y = cursor
          text  ue.acronyme.to_s + " - " +ue.titre.to_s , size: 13, style: :bold, :align => :left
           temp = page_start + ue.cours.count
          draw_text "p#{page_start} - #{temp}", style: :italic, size: 13, :at => [bounds.right - 45, y + 5]
           page_start = temp + 1
        end
       end
       move_down(5)
      transparent(0.75) { stroke_bounds }
    end


  end


end