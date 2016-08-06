class Rubrique < ActiveRecord::Base
  belongs_to :cour
  validates_presence_of :titre, :contenu, :cour_id
  validates_numericality_of :cour_id
  validates_uniqueness_of :titre
end
