class Ue < ActiveRecord::Base
  belongs_to :semestre
  has_many :cours
end
