# == Schema Information
#
# Table name: categorizings
#
#  id                 :integer          not null, primary key
#  category_id        :integer
#  categorizable_id   :integer
#  categorizable_type :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'test_helper'

class CategorizingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
