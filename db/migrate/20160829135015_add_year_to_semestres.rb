class AddYearToSemestres < ActiveRecord::Migration
  def change
    add_reference :semestres, :year, index: true, foreign_key: true
  end
end
