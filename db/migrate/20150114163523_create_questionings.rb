class CreateQuestionings < ActiveRecord::Migration
  def change
    create_table :questionings do |t|
      t.references :question, index: true
      t.references :counselor, index: true
      t.integer :priority

      t.timestamps
    end
  end
end
