class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.string :telephone

      t.timestamps
    end
  end
end
