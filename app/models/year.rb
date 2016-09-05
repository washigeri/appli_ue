class Year < ActiveRecord::Base
  has_many :semestres, :dependent => :destroy
  validates_numericality_of :copy_from, if: :copy?

  amoeba do
    enable
    customize(lambda { |original_year, new_year |
      new_year.copy_from = original_year.id
      new_year.copy = true
    })
  end

end
