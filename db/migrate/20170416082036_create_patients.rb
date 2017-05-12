class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :second_name, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :number, null: false
      t.string :number_polis, null: false
      t.boolean :is_platnik, null: false
      t.datetime :data_created, null: false
      t.string :index, null: false
      t.string :town, null: false
      t.string :street
      t.string :house, null: false
      t.string :corpus
      t.string :flat
      t.string :issued_by
      t.string :telefone
      t.string :seria, null: false
      t.string :nomer, null: false
      t.date :date_of_issue, null: false
      t.text :allergy, null: false, default: "Отсутствуют"

      t.index [:seria, :nomer], unique: true
      t.timestamps null: false
    end
  end
end
