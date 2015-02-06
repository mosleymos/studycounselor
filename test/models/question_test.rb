# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  name          :text
#  description   :text
#  research_name :text
#  first_letter  :string(255)
#  slug          :text
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
