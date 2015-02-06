class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :student, index: true
      t.references :counselor, index: true
      t.string :telephone
      t.datetime :date
      t.text :comment

      t.timestamps
    end
  end
end
