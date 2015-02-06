# == Schema Information
#
# Table name: leads
#
#  id                 :integer          not null, primary key
#  card_id            :integer
#  program_id         :integer
#  comment            :text
#  recall             :boolean
#  document           :boolean
#  approved_by_school :boolean
#  created_at         :datetime
#  updated_at         :datetime
#

require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
