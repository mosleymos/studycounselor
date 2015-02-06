# == Schema Information
#
# Table name: students
#
#  id                :integer          not null, primary key
#  first_name        :string(255)
#  last_name         :string(255)
#  telephone         :string(255)
#  age               :integer
#  mail              :string(255)
#  city              :string(255)
#  etablissement     :string(255)
#  previous_studies  :text
#  filieres          :string(255)
#  mean_grade        :integer
#  father_profession :string(255)
#  mother_profession :string(255)
#  general_comment   :text
#  first_letter      :string(255)
#  research_name     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
