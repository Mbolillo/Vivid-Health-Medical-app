class AddPrescriptionToPrescriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :prescriptions, :prescription, :string
  end
end
