class AddAcronymeToUes < ActiveRecord::Migration
  def change
    add_column :ues, :acronyme, :string
  end
end
