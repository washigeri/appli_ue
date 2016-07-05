class CreateRubriques < ActiveRecord::Migration
  def change
    create_table :rubriques do |t|
      t.string :titre
      t.string :description

      t.timestamps null: false
    end
  end
end
