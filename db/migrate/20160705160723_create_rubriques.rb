class CreateRubriques < ActiveRecord::Migration
  def change
    create_table :rubriques do |t|
      t.string :titre
      t.string :contenu
      t.string :objectif
      t.belongs_to :cour, index: true

      t.timestamps null: false
    end
  end
end
