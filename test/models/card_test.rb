# == Schema Information
#
# Table name: cards
#
#  id                   :integer          not null, primary key
#  appointment_datetime :datetime
#  comment_text         :text
#  avaibility_text      :text
#  student_id           :integer
#  counselor_id         :integer
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
