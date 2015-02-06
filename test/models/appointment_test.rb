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

require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
