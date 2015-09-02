# == Schema Information
#
# Table name: schools
#
#  id                :integer          not null, primary key
#  name              :text
#  description       :text
#  image_url         :string(255)
#  school_url        :string(255)
#  first_letter      :string(255)
#  research_name     :text
#  slug              :text
#  goals             :text
#  created_at        :datetime
#  updated_at        :datetime
#  address           :text
#  moto              :text
#  telephone         :string(255)
#  contact_mail      :string(255)
#  has_admin_account :boolean
#  statistics_text   :text
#  twitter_url       :text
#  facebook_url      :text
#  youtube_url       :text
#  linkedin_url      :text
#  student_number    :string(255)
#  photos_videos     :text
#  fees              :text
#

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
