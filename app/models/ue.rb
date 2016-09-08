class Ue < ActiveRecord::Base
  before_save :calc_ects_create
  before_validation :ajout_acro
  belongs_to :semestre
  has_many :cours, dependent: :destroy
  validates_presence_of :titre, :objectif, :lieu, :prerequis, :acronyme
  validates_uniqueness_of :acronyme, :scope => :semestre_id
  validates_numericality_of :ects_c, :allow_blank => true
  accepts_nested_attributes_for :cours, :reject_if => lambda { |a| a[:titre].blank? }, :allow_destroy => true

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

  scope :year, -> (year) { where('semestre_id IN (?)', Year.find(year['id']).semestres.map(&:id)) }

  scope :filtre_semestre, -> (semestre_ids) { where('semestre_id IN (?) ', semestre_ids) }
  scope :filtre_lieu, -> (lieu) { where('lieu IN (?)', lieu) }
  scope :filtre_ects, -> (ects) { where(ects_c: ects[0]..ects[1]) }

  scope :filtre_semestre_and_lieu, -> (semestre_ids, lieu) { filtre_semestre(semestre_ids).where('lieu IN (?) ', lieu) }
  scope :filtre_semestre_and_ects, -> (semestre_ids, ects) { filtre_ects(ects).where('semestre_id IN (?) ', semestre_ids) }
  scope :filtre_lieu_and_ects, -> (lieu, ects) { filtre_ects(ects).where('lieu IN (?)', lieu) }

  scope :filtre_all, -> (lieu, ects, semestre_ids) { filtre_lieu_and_ects(lieu, ects).where('semestre_id IN (?) ', semestre_ids) }

  amoeba do
    enable
  end

  def acro_sy
    "#{acronyme}:#{semestre.numero.humanize};#{semestre.year.value.humanize}"
  end

  private

  def calc_ects_create
    self.ects_c = ects_calc
  end

  def ajout_acro
    self.acronyme = self.acronyme.strip()
    if  acronyme.first != "[" and  acronyme.last != "]"
      self.acronyme = "[" + self.acronyme.to_s + "]"
    elsif acronyme.first != "[" and acronyme.last == "]"
      self.acronyme = "[" + self.acronyme
    elsif acronyme.first == "[" and acronyme.last != "]"
      self.acronyme =  self.acronyme + "]"
    end
  end


end
