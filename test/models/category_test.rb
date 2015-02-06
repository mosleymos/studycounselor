# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  image_url     :string(255)
#  research_name :string(255)
#  first_letter  :string(255)
#  slug          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
