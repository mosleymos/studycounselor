class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.references :card, index: true
      t.references :program, index: true
      t.text :comment
      t.boolean :recall
      t.boolean :document
      t.boolean :approved_by_school

      t.timestamps
    end
  end
end
