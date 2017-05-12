class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards do |t|
      t.integer :floor, null: false
      t.string :number, null: false
      t.string :departmen, null: false
      t.integer :capacity, null: false

      t.index [:floor, :number, :departmen, :capacity], unique: true
      t.timestamps null: false
    end
  end
end
