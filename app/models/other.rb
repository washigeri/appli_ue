class Other < ActiveRecord::Base
  validates_uniqueness_of :value, scope: :type
  validates_presence_of :value
  self.inheritance_column = :type

  def self.types
    %w(Genre Lieu)
  end

  scope :lieus, -> { where(type: 'Lieu') }
  scope :genres, -> { where(type: 'Genre') }

end
