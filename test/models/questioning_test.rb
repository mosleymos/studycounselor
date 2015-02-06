# == Schema Information
#
# Table name: questionings
#
#  id           :integer          not null, primary key
#  question_id  :integer
#  counselor_id :integer
#  priority     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class QuestioningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
