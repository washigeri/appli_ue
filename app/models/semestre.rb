class Semestre < ActiveRecord::Base
  has_many :ues
  validates_associated :ues
  validates_inclusion_of :numero, :in => %w( S1 S2 S3 S4 S5 S6), :message => "%{value} ne convient pas."
  validates :numero, length: { is: 2 , wrong_length: "Le nom de semestre doit comporter seulement deux caractères" }
  validates_presence_of :numero
  validates_uniqueness_of :numero
end
