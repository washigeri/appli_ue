class Ue < ActiveRecord::Base
  before_save :calc_ects_create
  belongs_to :semestre
  has_many :cours, dependent: :destroy
  validates_associated :cours
  validates_presence_of :titre, :objectif, :lieu, :prerequis, :semestre_id
  validates_uniqueness_of :titre
  validates_numericality_of :semestre_id, :ects_c, :allow_blank => true
  accepts_nested_attributes_for :cours, :reject_if => lambda { |a| a[:titre].blank? }, :allow_destroy => true
  def ects_calc
    temp = 0
    if not self.cours.empty?
      self.cours.each do |c|
        temp= temp + c.ects
      end
    end
    temp
  end

  private

  def calc_ects_create
    self.ects_c = ects_calc
  end

end
