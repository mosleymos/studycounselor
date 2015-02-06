# == Schema Information
#
# Table name: studyings
#
#  id           :integer          not null, primary key
#  counselor_id :integer
#  school_id    :integer
#  comment      :text
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class StudyingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
