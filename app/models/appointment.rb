# == Schema Information
#
# Table name: appointments
#
#  id           :integer          not null, primary key
#  student_id   :integer
#  counselor_id :integer
#  telephone    :string(255)
#  date         :datetime
#  comment      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Appointment < ActiveRecord::Base
  belongs_to :student
  belongs_to :counselor
  
  validates :telephone, presence: true
  validates :date, presence: true
  
end
