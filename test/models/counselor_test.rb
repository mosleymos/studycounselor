# == Schema Information
#
# Table name: counselors
#
#  id                        :integer          not null, primary key
#  first_name                :string(255)
#  last_name                 :string(255)
#  birthdate                 :date
#  telephone                 :string(255)
#  slug                      :string(255)
#  address                   :text
#  approved_by_administrator :boolean
#  created_at                :datetime
#  updated_at                :datetime
#  general_description       :text
#  school_description        :text
#  jobs_description          :text
#  availibility_description  :text
#  image_url                 :text
#  linkedin_url              :text
#  email                     :string(255)      default(""), not null
#  encrypted_password        :string(255)      default(""), not null
#  reset_password_token      :string(255)
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  sign_in_count             :integer          default(0), not null
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string(255)
#  last_sign_in_ip           :string(255)
#  confirmation_token        :string(255)
#  confirmed_at              :datetime
#  confirmation_sent_at      :datetime
#  unconfirmed_email         :string(255)
#  social_url                :hstore
#  school_name               :string(255)
#  moto                      :string(255)
#  study_domain              :string(255)
#  high_school               :string(255)
#  looking_job               :string(255)
#  bac_mention               :string(255)
#  study_level               :string(255)
#  study_financing           :string(255)
#

require 'test_helper'

class CounselorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
