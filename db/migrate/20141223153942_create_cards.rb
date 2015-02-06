class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.datetime :appointment_datetime
      t.text :comment_text
      t.text :avaibility_text
      t.references :student, index: true
      t.references :counselor, index: true

      t.timestamps
    end
  end
end
