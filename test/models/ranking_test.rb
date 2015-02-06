# == Schema Information
#
# Table name: rankings
#
#  id           :integer          not null, primary key
#  student_id   :integer
#  counselor_id :integer
#  comment      :text
#  grade        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
