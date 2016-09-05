class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :value
      t.boolean :copy
      t.integer :copy_from

      t.timestamps null: false
    end
  end
end
