class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.string :value
      t.string :type

      t.timestamps null: false
    end
  end
end
