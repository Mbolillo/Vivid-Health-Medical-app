class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :Medication1
      t.string :Dose1
      t.string :Quantity1
      t.string :Frecuency1
      t.string :Medication2
      t.string :Dose2
      t.string :Quantity2
      t.string :Frecuency2
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
    add_index :prescriptions, :patient_id
    add_index :prescriptions, :doctor_id
  end
end
