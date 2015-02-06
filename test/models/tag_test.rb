# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  image_url     :text
#  first_letter  :string(255)
#  research_name :string(255)
#  slug          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
