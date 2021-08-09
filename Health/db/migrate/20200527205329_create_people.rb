class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.text :address
      t.string :phone
      t.integer :gender
      t.string :discipline
      t.decimal :hourly_rate
      t.text :bio
      t.string :type
      t.integer :user_id

      t.timestamps
    end
    add_index :people, :user_id
  end
end
