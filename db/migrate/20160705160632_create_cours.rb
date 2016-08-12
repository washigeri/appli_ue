class CreateCours < ActiveRecord::Migration
  def change
    create_table :cours do |t|
      t.string :titre
      t.string :objectif
      t.string :contenu
      t.string :genre
      t.string :decoupage
      t.string :evaluation1
      t.string :evaluation2
      t.integer :coeff
      t.integer :ects
      t.string :bibliographie
      t.belongs_to :ue, index: true

      t.timestamps null: false
    end
  end
end
