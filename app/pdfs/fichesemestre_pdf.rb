class FichesemestrePdf < Prawn::Document

  def initialize(semestre)
    super()
    @semestre = semestre
    @ues = @semestre.ues
    header
    body
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
         @ues.each_with_index do |ue, compteur|
           y = cursor
          text ue.titre.to_s , size: 13, style: :bold, :align => :left
          draw_text "p#{3 * compteur + 2} - #{3 * compteur + 2 + ue.cours.count}", style: :italic, size: 13, :at => [bounds.right - 45, y + 5]
        end
       end
       move_down(5)
      transparent(0.75) { stroke_bounds }
    end


  end


end