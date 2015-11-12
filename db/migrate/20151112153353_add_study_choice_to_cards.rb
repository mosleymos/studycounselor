class AddStudyChoiceToCards < ActiveRecord::Migration
  def change
		add_column :cards, :future_study_choice, :string
		add_column :cards, :careers_interest, :string
  end
end
