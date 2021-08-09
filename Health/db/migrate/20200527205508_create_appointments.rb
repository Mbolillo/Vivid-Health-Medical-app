class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.integer :total_hours
      t.integer :status
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :payment_id

      t.timestamps
    end
    add_index :appointments, :patient_id
    add_index :appointments, :doctor_id
    add_index :appointments, :payment_id
  end
end
