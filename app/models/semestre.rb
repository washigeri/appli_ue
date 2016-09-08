class Semestre < ActiveRecord::Base
  belongs_to :year
  has_many :ues, :dependent => :destroy
  validates_associated :ues
  validates_inclusion_of :numero, :in => %w( S1 S2 S3 S4 S5 S6), :message => "%{value} ne convient pas. %{value} doit être compris dans S1 S2 S3 S4 S5 S6"
  validates :numero, length: { is: 2 , wrong_length: "%{value} doit comporter seulement deux caractères" }
  validates_presence_of :numero
  validates_uniqueness_of :numero, :scope => :year_id, :message => "%{value} existe déjà pour cette année"


  scope :year, -> (year) { where('year_id = ?', year["id"] )}

  amoeba do
    enable
  end

  def semestre_year
    "#{numero.humanize}:#{year.value.humanize}"
  end


  private



end
