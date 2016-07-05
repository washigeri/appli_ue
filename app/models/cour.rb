class Cour < ActiveRecord::Base
  belongs_to :ue
  has_many :rubriques
end
