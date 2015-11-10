class AddStudentChannelInfoToStudent < ActiveRecord::Migration
  def change
		add_column :students, :student_info_channel, :text
  end
end
