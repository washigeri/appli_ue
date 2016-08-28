class Ue < ActiveRecord::Base
  before_save :calc_ects_create, :ajout_acro
  belongs_to :semestre
  has_many :cours, dependent: :destroy
  validates_associated :cours
  validates_presence_of :titre, :objectif, :lieu, :prerequis, :semestre_id, :acronyme
  validates_uniqueness_of :titre, :scope => :semestre_id
  validates_numericality_of :semestre_id, :ects_c, :allow_blank => true
  accepts_nested_attributes_for :cours, :reject_if => lambda { |a| a[:titre].blank? }, :allow_destroy => true
  validates_uniqueness_of :acronyme

  self.per_page = 10

  def ects_calc
    temp = 0
    if not self.cours.empty?
      self.cours.each do |c|
        temp= temp + c.ects
      end
    end
    temp
  end



  scope :filtre_semestre, -> (semestre_ids) { where('semestre_id IN (?) ', semestre_ids) }
  scope :filtre_lieu, -> (lieu) { where('lieu IN (?)', lieu) }
  scope :filtre_ects, -> (ects) { where(ects_c: ects[0]..ects[1]) }

  scope :filtre_semestre_and_lieu, -> (semestre_ids, lieu) { filtre_semestre(semestre_ids).where('lieu IN (?) ', lieu) }
  scope :filtre_semestre_and_ects, -> (semestre_ids, ects) { filtre_ects(ects).where('semestre_id IN (?) ', semestre_ids) }
  scope :filtre_lieu_and_ects, -> (lieu, ects) { filtre_ects(ects).where('lieu IN (?)', lieu) }

  scope :filtre_all, -> (lieu, ects, semestre_ids) { filtre_lieu_and_ects(lieu, ects).where('semestre_id IN (?) ', semestre_ids) }

  private

  def calc_ects_create
    self.ects_c = ects_calc
  end

  def ajout_acro
    if  acronyme.first != "[" and  acronyme.last != "]"
      self.acronyme = "[" + self.acronyme.to_s + "]"
    elsif acronyme.first != "[" and acronyme.last == "]"
      self.acronyme = "[" + self.acronyme
    elsif acronyme.first == "[" and acronyme.last != "]"
      self.acronyme =  self.acronyme + "]"
    end
  end

end
