class CreateSemestres < ActiveRecord::Migration
  def change
    create_table :semestres do |t|
      t.string :numero
      t.belongs_to :year

      t.timestamps null: false
    end
  end
end
