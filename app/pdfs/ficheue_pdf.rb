class FicheuePdf < Prawn::Document

  def initialize(ue, flag_pages)
    super()
    @ue = ue
    @cours = @ue.cours
    header
    body(flag_pages)
    @cours.each_with_index do |cour, compteur|
      module_pdf(cour,compteur)
    end
  end


  def header
    image "#{Rails.root}/app/assets/images/logo_ensiie.png", width: 70, height: 70, :position => :left
    text "Fiche d'Unité d'Enseignement (UE)", :size => 20, style: :bold, :align => :center
  end

  def body(flag_pages)
    move_down(50)

    text "#{@ue.titre}", size: 15, style: :bold, :align => :center

    move_down(30)
    stroke_horizontal_rule
    move_down(20)
    bounding_box([30, cursor], :width => bounds.right - 30) do
      text "Objectif :", size: 13, style: :bold
      move_down(10)
      text @ue.objectif.to_s
    end
    move_down(30)
    y_box = cursor
    bounding_box([15,y_box], :width => bounds.right/2 - 15) do
      indent(10) do
        move_down(5)
        text "Semestre :", size: 13, style: :bold
        move_down(5)
        text @ue.semestre.numero.to_s
        move_down(20)
        text "Prérequis :", size: 13, style: :bold
        move_down(5)
        text @ue.prerequis.to_s
        move_down(20)
        text "Lieu :", size: 13, style: :bold
        move_down(5)
        text @ue.lieu.to_s
        move_down(20)
        text "ECTS :", size: 13, style: :bold
        move_down(5)
        text @ue.ects_c.to_s
        move_down(20)
        text "Nombre de modules :", size: 13, style: :bold
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
          text "Module #{compteur +1 } : #{cour.titre}", size: 14, style: :bold, :align => :center
          move_down(5)
          indent(10) do
            text "Objectif :", size: 13, style: :bold
            move_down(5)
            text cour.objectif.truncate(70, :separator => ' ')
            move_down(20)
            text "ECTS :", size: 13, style: :bold
            move_down(5)
            text cour.ects.to_s
            move_down(20)
            text "Type :", size: 13, style: :bold
            move_down(5)
            text cour.genre.to_s
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
      move_down(10)
      end
    end
  end

  def module_pdf(cour,compteur)
    start_new_page

    text "Module #{compteur + 1} : #{cour.titre}", size: 20, style: :bold
    stroke_horizontal_rule
    move_down(30)
    bounding_box([15, cursor], :width => bounds.width - 30, :height => bounds.height - 100) do
      move_down(10)
      indent(15) do
        text "Objectif :", size: 15, style: :bold
        move_down(10)
        text cour.objectif
        move_down(20)
        text "Contenu :", size: 15, style: :bold
        move_down(10)
        text cour.contenu
        move_down(20)
        text "Type :", size: 15, style: :bold
        move_down(10)
        text cour.genre
        move_down(20)
        text "Découpage :", size: 15, style: :bold
        move_down(10)
        text cour.decoupage
        move_down(20)
        text "Évaluation 1 :", size: 15, style: :bold
        move_down(10)
        text cour.evaluation1
        move_down(20)
        text "Évaluation 2 :", size: 15, style: :bold
        move_down(10)
        text cour.evaluation2
        move_down(20)
        text "Coefficient :", size: 15, style: :bold
        move_down(10)
        text cour.coeff.to_s
        move_down(20)
        text "ECTS :", size: 15, style: :bold
        move_down(10)
        text cour.ects.to_s
        move_down(20)
        text "Bibliographie :", size: 13, style: :bold
        move_down(10)
        text cour.bibliographie, size: 10
        move_down(10)
      end
      transparent(0.75) { stroke_bounds }
    end


  end

end