# == Schema Information
#
# Table name: programs
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  description              :text
#  program_url              :text
#  image_url                :text
#  school_id                :integer
#  equivalent_year          :string(255)
#  program_duration         :string(255)
#  admission_description    :text
#  first_letter             :string(255)
#  research_name            :string(255)
#  slug                     :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  diploma                  :string(255)
#  campus                   :string(255)
#  price                    :integer
#  perspectives_description :text
#  pedagogy_description     :text
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
