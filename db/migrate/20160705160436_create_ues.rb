class CreateUes < ActiveRecord::Migration
  def change
    create_table :ues do |t|
      t.string :titre
      t.string :objectif
      t.string :lieu
      t.string :prerequis
      t.integer :ects_c
      t.belongs_to :semestre, index: true
      t.string :prof_resp #temporaire

      t.timestamps null: false
    end
  end
end
