class CreateCours < ActiveRecord::Migration
  def change
    create_table :cours do |t|
      t.string :titre
      t.string :description
      t.string :type

      t.timestamps null: false
    end
  end
end
