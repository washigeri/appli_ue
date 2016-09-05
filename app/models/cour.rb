class Cour < ActiveRecord::Base
  after_save :update_ue
  after_destroy :update_ue
  belongs_to :ue
  validates_uniqueness_of :titre, :scope => :ue_id
  validates_presence_of :objectif, :contenu, :genre, :decoupage, :evaluation1, :coeff
  validates_numericality_of :coeff,:ects

  self.per_page = 10

  scope :year, -> (ues) { where('ue_id IN (?)', ues.map(&:id))}

  scope :ue, -> (ues_id) { where('ue_id IN (?) ', ues_id)}
  scope :genre, -> (genres) { where('genre IN (?)', genres) }
  scope :both, -> (genres, ues) { ue(ues).where('genre IN (?)', genres) }


  private

  def update_ue
    self.ue.update_column(:ects_c, self.ue.ects_calc)
  end


end
