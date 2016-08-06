class Ue < ActiveRecord::Base
  belongs_to :semestre
  has_many :cours
  validates_associated :cours
  validates_presence_of :titre, :objectif, :lieu, :prerequis, :semestre_id
  validates_uniqueness_of :titre
  validates_numericality_of :semestre_id
end
