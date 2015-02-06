class CreateJobbings < ActiveRecord::Migration
  def change
    create_table :jobbings do |t|
      t.references :job, index: true
      t.references :program, index: true

      t.timestamps
    end
  end
end
