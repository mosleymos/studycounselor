class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :student, index: true
      t.references :counselor, index: true
      t.text :comment
      t.integer :grade

      t.timestamps
    end
  end
end
