class CreateHospitalStayLists < ActiveRecord::Migration
  def change
    create_table :hospital_stay_lists do |t|
      t.references :patient, index: true, foreign_key: true
      t.datetime :receipt_date, null: false
      t.string :reason, null: false
      t.datetime :discharge_date, null: false
      t.string :discharge_epicrisis, null: false
      t.references :ward, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
