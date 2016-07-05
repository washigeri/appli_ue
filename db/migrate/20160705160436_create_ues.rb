class CreateUes < ActiveRecord::Migration
  def change
    create_table :ues do |t|
      t.string :titre
      t.string :description
      t.string :type
      t.string :lieu

      t.timestamps null: false
    end
  end
end
