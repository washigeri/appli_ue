class FicheuePdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  def initialize(ue, flag_pages, flag_sem = false)
    super()
    font_families.update('Helvetica' => {
        :normal => "#{Rails.root.to_s}/app/pdfs/Helvetica.ttf",
        :bold => "#{Rails.root.to_s}/app/pdfs/Helvetica_bold.ttf",
        :italic => "#{Rails.root.to_s}/app/pdfs/Helvetica_italic.ttf",
    })
    @ue = ue
    @cours = @ue.cours.order(:id)
    header
    body(flag_pages, flag_sem)
    @cours.each_with_index do |cour, compteur|
      module_pdf(cour,compteur)
    end

  end




  def header
    image "#{Rails.root}/app/assets/images/logo_ensiie.png", width: 70, height: 70, :position => :left
    text "Fiche d'Unité d'Enseignement (UE)", :size => 20, style: :bold, :align => :center
  end

  def body(flag_pages, flag_sem )
    move_down(50)

    text flag_sem ? "Semestre #{@ue.semestre.numero.last}: #{@ue.acronyme} - #{@ue.titre}" : "#{@ue.acronyme} - #{@ue.titre}" , size: 15, style: :bold, :align => :center

    move_down(30)
    stroke_horizontal_rule
    move_down(20)
    bounding_box([30, cursor], :width => bounds.right - 30) do
      text "Objectif :", size: 11, style: :bold
      move_down(10)
      text @ue.objectif.to_s
    end
    move_down(30)
    y_box = cursor
    bounding_box([15,y_box], :width => bounds.right/2 - 15) do
      indent(10) do
        move_down(5)
        text "Semestre :", size: 11, style: :bold
        move_down(5)
        text @ue.semestre.numero.to_s
        move_down(20)
        text "Prérequis :", size: 11, style: :bold
        move_down(5)
        text @ue.prerequis.to_s
        move_down(20)
        text "Lieu :", size: 11, style: :bold
        move_down(5)
        text @ue.lieu.to_s
        move_down(20)
        text "ECTS :", size: 11, style: :bold
        move_down(5)
        text @ue.ects_c.to_s
        move_down(20)
        text "Nombre de modules :", size: 11, style: :bold
        move_down(5)
        text @ue.cours.count.to_s
        move_down(5)
      end
      transparent(0.75) { stroke_bounds }
    end
    bounding_box([bounds.right/2 + 15, y_box], :width => bounds.right/2 - 15) do
      @cours.each_with_index do |cour, compteur |
        bounding_box([0, cursor ], :width => bounds.width ) do
          move_down(5)
          text "Module #{compteur +1 } : #{cour.titre}", size: 11, style: :bold, :align => :center
          move_down(5)
          indent(10) do
            text "ECTS : #{cour.ects.to_s}", size: 11, style: :bold
            move_down(20)
            text "Type : #{cour.genre.to_s}", size: 11, style: :bold
            move_down(20)
            text "Coefficient : #{number_to_human(cour.coeff).to_s}", size: 11, style: :bold
          move_down(5)
          end
          if flag_pages
            indent(5) do
              text "cf page #{compteur + 2 }", size: 9, style: :italic, :align => :left
            end
          end
          move_down(2)
          transparent(0.75) { stroke_bounds }
        end
      end
    end
  end

  def module_pdf(cour,compteur)
    start_new_page
    text "Module #{compteur + 1} : #{cour.titre}", size: 20, style: :bold
    stroke_horizontal_rule
    move_down(10)
    bounding_box([15, cursor], :width => bounds.width - 30, :height => bounds.height - 100) do
      move_down(10)
      indent(15) do
        text "Objectif :", size: 11, style: :bold
        move_down(5)
        text cour.objectif, size: 9
        move_down(20)
        text "Contenu :", size: 11, style: :bold
        move_down(5)
        text cour.contenu, size: 9
        move_down(20)
        text "Type :", size: 11, style: :bold
        move_down(5)
        text cour.genre, size: 9
        move_down(20)
        text "Découpage :", size: 11, style: :bold
        move_down(5)
        text cour.decoupage, size: 9
        move_down(20)
        text "Évaluation 1 :", size: 11, style: :bold
        move_down(5)
        text cour.evaluation1, size: 9
        move_down(20)
        text "Évaluation 2 :", size: 11, style: :bold
        move_down(5)
        text cour.evaluation2, size: 9
        move_down(20)
        text "Coefficient :", size: 11, style: :bold
        move_down(5)
        text cour.coeff.to_s, size: 9
        move_down(20)
        text "ECTS :", size: 11, style: :bold
        move_down(5)
        text cour.ects.to_s, size: 9
        move_down(20)
        text "Bibliographie :", size: 11, style: :bold
        move_down(5)
        text cour.bibliographie, size: 8
        move_down(5)
      end
      transparent(0.75) { stroke_bounds }
    end


  end

end