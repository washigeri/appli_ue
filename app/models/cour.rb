class Cour < ActiveRecord::Base
  belongs_to :ue
  has_many :rubriques
  validates_associated :rubriques
  validates_uniqueness_of :titre
  validates_presence_of :objectif, :contenu, :genre, :decoupage, :evaluation1, :coeff, :ue_id
  validates_numericality_of :coeff, :ue_id
end
